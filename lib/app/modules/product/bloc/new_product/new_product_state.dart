import 'dart:io';

import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class NewProductState extends Equatable {
  const NewProductState({
    this.product,
    this.isLoad = false,
    this.messageError = '',
    this.isError = false,
    this.isSuccess = false,
    this.localImage,
    this.isErroLoadImage = false,
    this.categories = const [],
  });

  factory NewProductState.init() {
    return const NewProductState();
  }

  NewProductState copyWith({
    ClepyProduct? product,
    bool? isLoad,
    String? messageError,
    bool? isError,
    bool? isSuccess,
    File? localImage,
    bool? isErroLoadImage,
    List<ClepyCategory>? categories,
  }) {
    return NewProductState(
      product: product ?? this.product,
      isLoad: isLoad ?? this.isLoad,
      messageError: messageError ?? this.messageError,
      isError: isError ?? this.isError,
      isSuccess: isSuccess ?? this.isSuccess,
      localImage: localImage ?? this.localImage,
      isErroLoadImage: isErroLoadImage ?? this.isErroLoadImage,
      categories: categories ?? this.categories,
    );
  }

  final ClepyProduct? product;
  final bool isLoad;
  final String messageError;
  final bool isError;
  final bool isErroLoadImage;
  final bool isSuccess;
  final File? localImage;
  final List<ClepyCategory> categories;

  @override
  List<Object> get props => [
        isError,
        isLoad,
        messageError,
        isSuccess,
        isErroLoadImage,
        localImage != null,
        categories,
      ];
}
