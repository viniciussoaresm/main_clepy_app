import 'package:clepy/app/modules/home/bloc/feed_bloc.dart';
import 'package:clepy/app/modules/home/bloc/feed_event.dart';
import 'package:clepy/app/modules/home/bloc/feed_state.dart';
import 'package:clepy_ui/components/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FeedScreen extends StatelessWidget {
  FeedScreen({
    Key? key,
  }) : super(key: key);

  FeedBloc feedBloc = Modular.get<FeedBloc>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (_) => feedBloc,
        child: BlocBuilder<FeedBloc, FeedState>(
          builder: (context, state) {
            if (state is FeedStateInitial) {
              feedBloc.add(
                FeedEventLoadInitial(),
              );
            } else if (state is FeedStateLoadSuccess) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        return ProductTile(
                          product: state.products[index],
                          onTap: () {
                            Modular.to.pushNamed(
                                "/product/${state.products[index].uid}");
                          },
                        );
                      },
                    ),
                  )
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
