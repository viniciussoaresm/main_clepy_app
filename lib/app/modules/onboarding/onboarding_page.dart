import 'package:card_swiper/card_swiper.dart';
import 'package:clepy/app/shared/enums/route_names.dart';
import 'package:clepy_caches/clepy_caches.dart';
import 'package:clepy_ui/clepy_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:domain/domain.dart';

class OnboardingPage extends StatelessWidget {
  final List<String> imagens = [
    'assets/imagens/bem_vindo.png',
    'assets/imagens/alugar.png',
    'assets/imagens/ganhe_clepy.png',
  ];
  final List<String> titulo = [
    'Bem Vindo',
    'Encontre o que precisa',
    'Disponibilize seus itens para aluguel',
  ];
  final List<String> texto = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac nulla facilisis, viverra metus eu, efficitur magna. Suspendisse pulvinar auctor massa',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac nulla facilisis, viverra metus eu, efficitur magna. Suspendisse pulvinar auctor massa',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac nulla facilisis, viverra metus eu, efficitur magna. Suspendisse pulvinar auctor massa',
  ];

  final SwiperController _controller = SwiperController();

  OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SetUserConfigs setUserConfigs = Modular.get<SetUserConfigs>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              alignment: Alignment.centerRight,
              width: double.infinity,
              child: IconButton(
                onPressed: () {
                  setUserConfigs(
                    UserConfigs(
                      showOnboarding: false,
                    ),
                  );
                  Modular.to.pushReplacementNamed(Routes.home.path);
                },
                icon: Icon(
                  CupertinoIcons.clear_circled,
                  color: ClepyColors.brandLight,
                ),
              ),
            ),
            Expanded(
              child: Swiper(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Image.asset(imagens[index]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          titulo[index],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: ClepyColors.brandPrimary),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          texto[index],
                          style: TextStyle(
                            color: ClepyColors.brandPrimary,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 30,
                          ),
                          child: PrimaryButton(
                            onTap: () {
                              setUserConfigs(
                                UserConfigs(
                                  showOnboarding: false,
                                ),
                              );
                              Modular.to.pushReplacementNamed(Routes.home.path);
                            },
                            label: "Pular",
                            labelColor: Colors.white,
                          ),
                        ),
                      )
                    ],
                  );
                },
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.grey,
                    activeColor: Colors.blue,
                  ),
                ),
                controller: _controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
