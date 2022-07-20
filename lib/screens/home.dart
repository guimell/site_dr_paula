import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../config.dart';
import '../widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final String title = "Home";

  @override
  Widget build(BuildContext context) {
    SiteConfig.screenHeight = MediaQuery.of(context).size.height;
    SiteConfig.screenWidth = MediaQuery.of(context).size.width;

    final bool smallScreen = SiteConfig.screenWidth < SiteConfig.screenHeight;

    List<Widget> topInnerRectangle = [
      Expanded(
        flex: 1,
        child: Container(
          child: Image.asset(
            "assets/images/paula/logoMarca.jpeg",
            fit: BoxFit.fill,
          ),
        ),
      ),
      Expanded(
        flex: smallScreen ? 1 : 2,
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Text(
            "Dra.Paula Brasil\nEspecialista\nHarmonização Orofacial",
            style: TextStyle(
              fontSize: SiteConfig.screenWidth / 75 + 15,
              color: const Color.fromARGB(255, 175, 127, 75),
            ),
          ),
        ),
      ),
    ];
    List<Widget> botInnerRectangle = [
      Expanded(
        flex: smallScreen ? 2 : 2,
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Text(
            "Sou Dra Paula Roberta Brasil, graduada em Odontologia há 16 anos e no decorrer desse tempo,"
            " venho realizando diversos cursos de atualização,"
            " especialização e também mestrado com fins de oferecer o melhor serviço para meus pacientes,"
            " ou seja, você que está visitando minha página! \n\n"
            "Sou apaixonada pela estética desde minha infância,"
            " por isso encontrar a sua melhor versão será um grande prazer e uma imensa alegria. Minha maior ESPECIALIDADE é deixar você mais BONITA e NATURAL,"
            " através da HARMONIZAÇÃO OROFACIAL.",
            style: TextStyle(
              color: SiteConfig.lightColors.primary,
            ),
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          child: Image.asset(
            "assets/images/paula/paulaVacina.jpg",
            fit: BoxFit.fill,
          ),
        ),
      ),
    ];

    List<Widget> innerRectangle = [
      Expanded(
        child: Container(
          width: SiteConfig.screenWidth,
          color: SiteConfig.lightColors.primary.withAlpha(25),
          child: smallScreen
              ? Column(
                  children: topInnerRectangle,
                )
              : Row(
                  children: topInnerRectangle,
                ),
        ),
      ),
      Expanded(
        child: Container(
          color: SiteConfig.lightColors.primary.withAlpha(25),
          child: smallScreen
              ? Column(
                  children: botInnerRectangle,
                )
              : Row(
                  children: botInnerRectangle,
                ),
        ),
      ),
    ];

    List<Widget> outerRectangle = [
      Expanded(
        flex: 1,
        child: Container(
          child: Image.asset(
            "assets/images/paula/paulaPerfil.jpg",
            fit: BoxFit.fill,
          ),
        ),
      ),
      Expanded(
        flex: smallScreen ? 1 : 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: innerRectangle,
        ),
      ),
    ];

    return Scaffold(
      appBar: SiteConfig.getAppBar(context, title),
      floatingActionButton: SiteConfig.getFAB(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: SiteConfig.screenHeight * 0.6,
              width: SiteConfig.screenWidth,
              child: Container(
                child: Image.asset(
                  "assets/images/paula/paulaMao.jpg",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              color: SiteConfig.lightColors.primary.withAlpha(100),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                ),
                items: [
                  const CarouselItem(
                    items: [
                      "assets/images/serviços/bichectomia.jpg",
                      "assets/images/serviços/bioestimuladores.jpg",
                      "assets/images/serviços/botox.png",
                      "assets/images/serviços/microagulhamento.jpg",
                    ],
                  ),
                  const CarouselItem(
                    items: [
                      "assets/images/serviços/pdo.jpg",
                      "assets/images/serviços/peeling.jpg",
                      "assets/images/serviços/Preenchimento.jpg",
                      "assets/images/paula/logoMarca.jpeg"
                    ],
                  )
                ].map(
                  (i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return i;
                      },
                    );
                  },
                ).toList(),
              ),
            ),
            SizedBox(
              height: smallScreen
                  ? SiteConfig.screenHeight * 2.0
                  : SiteConfig.screenHeight * 0.8,
              width: SiteConfig.screenWidth,
              child: smallScreen
                  ? Column(
                      children: outerRectangle,
                    )
                  : Row(
                      children: outerRectangle,
                    ),
            ),
            SiteConfig.getFooter(),
          ],
        ),
      ),
    );
  }
}
