import 'package:clepy/app/modules/product/bloc/new_product/new_product_state.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewProductCubit extends Cubit<NewProductState> {
  NewProductCubit({
    required this.productsService,
  }) : super(
          const NewProductState(),
        );

  final ProductsService productsService;

  void save(ClepyProduct product) {
    emit(state.copyWith(isLoad: true));

    try {
      productsService.insertProduct(product);

      emit(
        state.copyWith(
          isLoad: false,
          product: product,
        ),
      );
    } catch (exception) {
      emit(state.copyWith(
        isLoad: false,
        product: product,
        isError: true,
        messageError: exception.toString(),
      ));
    }
  }
}
