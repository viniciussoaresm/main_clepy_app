import 'package:clepy/app/modules/product/components/custom_app_bar.dart';
import 'package:clepy/app/shared/blocs/product/product_cubit.dart';
import 'package:clepy/app/shared/blocs/product/product_state.dart';
import 'package:clepy/app/shared/components/clepy_scaffold.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/body.dart';
import '../components/size_config.dart';

class ProductPage extends StatelessWidget {
  static String routeName = "/details";

  const ProductPage({
    Key? key,
    required this.uid,
  }) : super(key: key);

  final String uid;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        ClepyProduct? product =
            state.products.firstWhere((element) => element.uid == uid);

        return ClepyScaffold(
          backgroundColor: const Color(0xFFF5F6F9),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: const CustomAppBar(),
          ),
          body: Body(product: product),
        );
      },
    );
  }
}
