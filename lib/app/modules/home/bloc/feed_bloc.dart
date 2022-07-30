import 'package:clepy/app/shared/blocs/product/product_cubit.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'feed_event.dart';
import 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {
  final ProductCubit productCubit;

  FeedCubit({required this.productCubit}) : super(FeedStateInitial()) {
    // on<FeedEvent>((event, emit) async {
    //   emit(FeedStateLoadingInProgress());
    //
    //   List<ClepyProduct> products = [];
    //   String? categoryId;
    //
    //   if (event is FeedEventFindByCategory) {
    //     categoryId = event.categoryId;
    //   }
    //
    //   products = retrieverFeedProducts(
    //     categoryId: categoryId,
    //   );
    //
    //   emit(FeedStateLoadSuccess(products: products));
    // });
  }

  List<ClepyProduct> retrieverFeedProducts({String? categoryId}) {
    List<ClepyProduct> products = productCubit.state.products;

    if (categoryId != null) {
      products = products
        ..removeWhere((element) => element.uidCategory != categoryId);
    }

    return products;
  }
}
