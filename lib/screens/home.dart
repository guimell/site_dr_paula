import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../config.dart';
import '../widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  final String title = "Home";

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SiteConfig.screenSize = MediaQuery.of(context).size;
    SiteConfig.smallScreen =
        SiteConfig.screenSize.width < SiteConfig.screenSize.height;

    final List<Widget> carouselImages = [
      // ignore: prefer_const_constructors
      CarouselImage(
        image: "assets/images/serviços/pdo.jpg",
        title: "pdo",
        index: 1,
      ),
      // ignore: prefer_const_constructors
      CarouselImage(
        image: "assets/images/serviços/bioestimuladores.jpg",
        title: "bioestimuladores",
        index: 2,
      ),
      // ignore: prefer_const_constructors
      CarouselImage(
        image: "assets/images/paula/logoMarca.jpeg",
        title: "logoMarca",
        index: 3,
      ),
      // ignore: prefer_const_constructors
      CarouselImage(
        image: "assets/images/serviços/peeling.jpg",
        title: "peeling",
        index: 4,
      ),
      // ignore: prefer_const_constructors
      CarouselImage(
        image: "assets/images/serviços/microagulhamento.jpg",
        title: "microagulhamento",
        index: 5,
      ),
      // ignore: prefer_const_constructors
      CarouselImage(
        image: "assets/images/serviços/botox.png",
        title: "botox",
        index: 6,
      ),
      // ignore: prefer_const_constructors
      CarouselImage(
        image: "assets/images/serviços/Preenchimento.jpg",
        title: "preenchimento",
        index: 7,
      ),
      // ignore: prefer_const_constructors
      CarouselImage(
        image: "assets/images/serviços/bichectomia.jpg",
        title: "bichectomia",
        index: 8,
      ),
    ];

    List<Widget> topInnerRectangle = [
      Expanded(
        flex: 1,
        child: Image.asset(
          "assets/images/paula/logoMarcaT.png",
          fit: BoxFit.contain,
        ),
      ),
      Expanded(
        flex: SiteConfig.smallScreen ? 1 : 2,
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Text(
            "Dra.Paula Brasil\nEspecialista\nHarmonização Orofacial",
            style: TextStyle(
              fontSize: SiteConfig.screenSize.width / 75 + 15,
              color: const Color.fromARGB(255, 175, 127, 75),
            ),
          ),
        ),
      ),
    ];
    List<Widget> botInnerRectangle = [
      Expanded(
        flex: SiteConfig.smallScreen ? 2 : 2,
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
        child: Image.asset(
          "assets/images/paula/paulaVacina.jpg",
          fit: BoxFit.contain,
        ),
      ),
    ];

    List<Widget> innerRectangle = [
      Expanded(
        child: Container(
          child: SiteConfig.smallScreen
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
          child: SiteConfig.smallScreen
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
        child: Image.asset(
          "assets/images/paula/paulaPerfil.jpg",
          fit: BoxFit.contain,
        ),
      ),
      Expanded(
        flex: SiteConfig.smallScreen ? 1 : 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: innerRectangle,
        ),
      ),
    ];

    return Scaffold(
      appBar: SiteConfig.getAppBar(context, widget.title),
      floatingActionButton: SiteConfig.getFAB(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: SiteConfig.lightColors.primary.withAlpha(25),
              height: SiteConfig.screenSize.height * 0.9,
              width: SiteConfig.screenSize.width,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/paula/paulaMao.jpg",
                    fit: BoxFit.fitHeight,
                  ),
                  Align(
                    alignment: SiteConfig.smallScreen
                        ? Alignment.bottomCenter
                        : Alignment.bottomRight,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 100,
                        horizontal: 50,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color:
                              SiteConfig.lightColors.background.withAlpha(50),
                          blurRadius: 50,
                          spreadRadius: 20,
                        )
                      ]),
                      child: Text(
                        "TITLE TITLE\nSUB SUB",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: SiteConfig.lightColors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  height: SiteConfig.smallScreen
                      ? SiteConfig.screenSize.width * 0.8
                      : SiteConfig.screenSize.width * 0.2,
                  enableInfiniteScroll: true,
                  autoPlay: false,
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return SiteConfig.smallScreen
                      ? Row(
                          children: [carouselImages[index]],
                        )
                      : index == 0
                          ? Row(
                              children: [
                                carouselImages[0],
                                carouselImages[1],
                                carouselImages[2],
                                carouselImages[3],
                              ],
                            )
                          : Row(
                              children: [
                                carouselImages[4],
                                carouselImages[5],
                                carouselImages[6],
                                carouselImages[7],
                              ],
                            );
                },
                itemCount: SiteConfig.smallScreen ? 8 : 2,
              ),
            ),
            Container(
              color: SiteConfig.lightColors.primary.withAlpha(25),
              height: SiteConfig.smallScreen
                  ? SiteConfig.screenSize.height * 2.0
                  : SiteConfig.screenSize.height * 0.8,
              width: SiteConfig.screenSize.width,
              child: SiteConfig.smallScreen
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
