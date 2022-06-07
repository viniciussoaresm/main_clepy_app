import 'package:clepy/app/modules/home/bloc/feed_bloc.dart';
import 'package:clepy/app/modules/home/bloc/feed_event.dart';
import 'package:clepy/app/modules/home/bloc/feed_state.dart';
import 'package:clepy_ui/components/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (_) => FeedBloc(FeedStateInitial()),
        child: BlocBuilder<FeedBloc, FeedState>(
          builder: (context, state) {
            if (state is FeedStateInitial) {
              BlocProvider.of<FeedBloc>(context).add(
                FeedEventLoadInitial(),
              );
            } else if (state is FeedStateLoadSuccess) {
              print(state);
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        return ProductTile(
                          product: state.products[index],
                          onTap: () {
                            Modular.to.pushNamed('/product');
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
