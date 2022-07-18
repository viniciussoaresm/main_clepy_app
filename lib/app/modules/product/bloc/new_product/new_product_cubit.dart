import 'dart:io';

import 'package:clepy/app/modules/product/bloc/new_product/new_product_state.dart';
import 'package:domain/domain.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class NewProductCubit extends Cubit<NewProductState> {
  NewProductCubit({
    required this.productsService,
    required this.categoryService,
  }) : super(
          const NewProductState(),
        );

  final ProductsService productsService;
  final CategoryService categoryService;

  final nameTextController = TextEditingController();
  final priceTextController = TextEditingController();
  final modelTextController = TextEditingController();
  String? selectedCategoryUid;
  String? urlPicture;
  bool? checkTerms = false;

  void setCheckTerms(bool check) {
    checkTerms = check;
    emit(state);
  }

  void setSelectedCategory(String uid) {
    selectedCategoryUid = uid;
  }

  void loadCategories() async {
    final categories = await categoryService.getAll();

    emit(
      state.copyWith(
        categories: categories,
      ),
    );
  }

  void uploadImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        emit(
          state.copyWith(
            localImage: File(
              image.path,
            ),
          ),
        );
      }
    } on PlatformException catch (_) {
      state.copyWith(
        isErroLoadImage: true,
      );
    }
  }

  void save(ClepyProduct product) {
    emit(
      state.copyWith(
        isLoad: true,
        product: product,
      ),
    );
    _saveProduct(product);
  }

  void _saveProduct(ClepyProduct product) async {
    try {
      final productJson = await productsService.insertProduct(product);

      product.uid = productJson.id;
      final urlImage = await _uploadImage(product.uid!);
      product.urlPicture = urlImage;
      product.uidCategory = selectedCategoryUid;

      productsService.update(
        product.uid ?? '',
        product.toMap(),
      );

      emit(
        state.copyWith(
          isLoad: false,
          isSuccess: true,
        ),
      );
    } catch (exception) {
      emit(
        state.copyWith(
          isLoad: false,
          product: product,
          isError: true,
          messageError: exception.toString(),
        ),
      );
    }
  }

  Future<String?> _uploadImage(String productUid) async {
    final storageRef = FirebaseStorage.instance.ref();

    final mountainImagesRef = storageRef.child("product/$productUid");

    final task = mountainImagesRef.putFile(state.localImage!);

    bool success = await task.resume();

    if (success) {
      Exception("Erro ao carregar!");
      return null;
    }

    return await mountainImagesRef.getDownloadURL();
  }
}
