import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class NewProductState extends Equatable {
  const NewProductState({
    this.product,
    this.isLoad = false,
    this.messageError = '',
    this.isError = false,
    this.isSuccess = false,
  });

  factory NewProductState.init() {
    return const NewProductState();
  }

  NewProductState copyWith(
      {ClepyProduct? product,
      bool? isLoad,
      String? messageError,
      bool? isError,
      bool? isSuccess}) {
    return NewProductState(
      product: product ?? this.product,
      isLoad: isLoad ?? this.isLoad,
      messageError: messageError ?? this.messageError,
      isError: isError ?? this.isError,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  final ClepyProduct? product;
  final bool isLoad;
  final String messageError;
  final bool isError;
  final bool isSuccess;

  @override
  List<Object> get props => [
        isError,
        isLoad,
        messageError,
        isSuccess,
      ];
}
