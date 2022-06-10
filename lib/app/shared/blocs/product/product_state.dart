import 'package:domain/entities/clepy_product.dart';
import 'package:equatable/equatable.dart';

class ProductState extends Equatable {
  final List<ClepyProduct> products;
  final bool isLoading;
  final bool isError;

  const ProductState({
    this.products = const [],
    this.isError = false,
    this.isLoading = false,
  });

  @override
  List<Object> get props => [
        products,
        isError,
        isLoading,
      ];
}
