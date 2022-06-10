import 'package:clepy/app/shared/blocs/product/product_cubit.dart';
import 'package:clepy/app/shared/blocs/user_config/user_configs_cubit.dart';
import 'package:clepy/app/shared/blocs/user_config/user_configs_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  UserConfigsCubit userConfigsCubit = Modular.get<UserConfigsCubit>();
  ProductCubit productCubit = Modular.get<ProductCubit>();

  @override
  void initState() {
    super.initState();
    userConfigsCubit.loadUserConfig();
    productCubit.retrieverFeedProducts();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserConfigsCubit, UserConfigsState>(
      listener: (context, state) {
        if (state.configs != null) {
          if (state.configs!.showOnboarding) {
            Modular.to.pushReplacementNamed('/onboarding');
          } else {
            Modular.to.pushReplacementNamed('/home');
          }
        }
      },
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo-horizontal.png'),
              const SizedBox(height: 50),
              const CircularProgressIndicator(
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
