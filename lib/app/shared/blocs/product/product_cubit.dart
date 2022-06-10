import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({
    required this.productsService,
  }) : super(
          const ProductState(),
        );

  final ProductsService productsService;

  void retrieverFeedProducts() async {
    emit(
      const ProductState(
        isLoading: true,
      ),
    );
    try {
      List<ClepyProduct> clepyProducts = await productsService.getAll();
      emit(
        ProductState(products: clepyProducts),
      );
    } catch (exception) {
      emit(
        const ProductState(
          isError: true,
        ),
      );
    }
  }
}
