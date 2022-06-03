import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feed_event.dart';
import 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc(FeedState initialState) : super(initialState) {
    on<FeedEvent>((event, emit) async {
      // emitir estado de carregamento inicial
      emit(FeedStateLoadingInProgress());

      //carregar produtos
      List<ClepyProduct> products = await retrieverFeedProducts();
      print('total');
      print(products.length);
      //emitir estado de carregamento finalizado
      emit(FeedStateLoadSuccess(products: products));
    });
  }
}

Future<List<ClepyProduct>> retrieverFeedProducts() async {
  return await ProductsService().getProductByCategory('ixge1D94l6iyvkeGiCf8');
}
