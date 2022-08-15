import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../config.dart';
import '../widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  final String title = "Home";
  final String textService1 =
      "A P2P é uma empresa de consultoria em gestão de saúde ocupacional e segurança do trabalho,"
      "feita por pessoas para pessoas. Surgimos para trazer soluções de medicina, ergonomia e segurança do trabalho para micro e pequenas empresas,"
      "auxiliando-as no cumprimento da legislação vigente e agregando valor ao cuidado com os colaboradores,"
      "através de uma visão integral da saúde."
      "Acreditamos que a saúde e segurança do trabalho, quando bem feitas, não são um custo para as empresas, mas sim um investimento, "
      "através da redução das tributações e das ausências do trabalhador por motivo de saúde, melhora da produtividade dos colaboradores.";
  final String textService3 =
      "Apoiar os empresários a tornarem suas empresas mais produtivas e eficientes através da saúde e segurança dos trabalhadores.";
  final String textService4 =
      " Ser reconhecida nacionalmente pela qualidade do serviços e atendimento aos clientes.";
  final String textService5 =
      " Ser reconhecida nacionalmente pela qualidade do serviços e atendimento aos clientes.";
  final String textService6 =
      "+ A vida em 1 lugar\n+Ética é inegociável\n+Eficiência nos processos\n+Qualidade dos serviços\n+Inovação\n+Foco no cliente";
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  CarouselController carouselController = CarouselController();
  final List<Widget> carouselImages = [
    // ignore: prefer_const_constructors
    // CarouselImage(
    //   image: "assets/images/serviços/serviço2.jpeg",
    //   title: "",
    //   index: 1,
    // ),
    // // ignore: prefer_const_constructors
    // CarouselImage(
    //   image: "assets/images/serviços/CarretelConfuso.png",
    //   title: "BIOESTIMULADORES",
    //   index: 2,
    // ),
    // // ignore: prefer_const_constructors
    // CarouselImage(
    //   image: "assets/images/serviços/peeling.jpg",
    //   title: "PEELING",
    //   index: 3,
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    double iconSize = 30;
    SiteConfig.screenSize = MediaQuery.of(context).size;
    SiteConfig.smallScreen =
        SiteConfig.screenSize.width < SiteConfig.screenSize.height;
    SiteConfig.platformBrightness = MediaQuery.of(context).platformBrightness;

    final List<Widget> greenRectangle = [
      ServiceContainer(
        title: "Quem somos",
        text: widget.textService1,
      ),
      SiteConfig.smallScreen
          ? Column(
              children: [
                Container(
                  margin: SiteConfig.smallScreen
                      ? const EdgeInsets.all(24)
                      : const EdgeInsets.all(48),
                  padding: SiteConfig.smallScreen
                      ? const EdgeInsets.all(12)
                      : const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    // color: Colors.white.withAlpha(150),
                    color: SiteConfig.lightColors.primary.withAlpha(25),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.flag_circle,
                        size: 50,
                        color: SiteConfig.lightColors.background,
                      ),
                      Text(
                        "Nossa missão",
                        style: TextStyle(
                            color: SiteConfig.lightColors.primary,
                            fontSize: SiteConfig.getHeadingSize()),
                      ),
                      Text(
                        "\n\nApoiar os empresários a tornarem suas empresas mais produtivas e eficientes através da saúde e segurança dos trabalhadores.",
                        style: TextStyle(
                            color: SiteConfig.lightColors.background,
                            fontSize: SiteConfig.getTextSize()),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: SiteConfig.smallScreen
                      ? const EdgeInsets.all(24)
                      : const EdgeInsets.all(48),
                  padding: SiteConfig.smallScreen
                      ? const EdgeInsets.all(12)
                      : const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    // color: Colors.white.withAlpha(150),
                    color: SiteConfig.lightColors.primary.withAlpha(25),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.remove_red_eye,
                        size: 50,
                        color: SiteConfig.lightColors.background,
                      ),
                      Text(
                        "Nossa visão",
                        style: TextStyle(
                            color: SiteConfig.lightColors.primary,
                            fontSize: SiteConfig.getHeadingSize()),
                      ),
                      Text(
                        "\n\nSer reconhecida nacionalmente pela qualidade do serviços e atendimento aos clientes.",
                        style: TextStyle(
                            color: SiteConfig.lightColors.background,
                            fontSize: SiteConfig.getTextSize()),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: SiteConfig.smallScreen
                      ? const EdgeInsets.all(24)
                      : const EdgeInsets.all(48),
                  padding: SiteConfig.smallScreen
                      ? const EdgeInsets.all(12)
                      : const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    // color: Colors.white.withAlpha(150),
                    color: SiteConfig.lightColors.primary.withAlpha(25),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 50,
                        color: SiteConfig.lightColors.background,
                      ),
                      Text(
                        "Nossos valores",
                        style: TextStyle(
                            color: SiteConfig.lightColors.primary,
                            fontSize: SiteConfig.getHeadingSize()),
                      ),
                      Text(
                        "\n\n+A vida em 1 lugar\n+Ética é inegociável\n+Eficiência nos processos\n+Qualidade dos serviços\n+Inovação\n+Foco no cliente",
                        style: TextStyle(
                            color: SiteConfig.lightColors.background,
                            fontSize: SiteConfig.getTextSize()),
                      )
                    ],
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                InteractiveContent(
                    title: "Nossa missão",
                    icon: Icons.flag_circle,
                    text:
                        "\n\nApoiar os empresários a tornarem suas empresas mais produtivas e eficientes através da saúde e segurança dos trabalhadores."),
                InteractiveContent(
                    title: "Nossa visão",
                    icon: Icons.remove_red_eye,
                    text:
                        "\n\nSer reconhecida nacionalmente pela qualidade do serviços e atendimento aos clientes."),
                InteractiveContent(
                    title: "Nossos valores",
                    icon: Icons.star_rounded,
                    text:
                        "\n\n+A vida em 1 lugar\n+Ética é inegociável\n+Eficiência nos processos\n+Qualidade dos serviços\n+Inovação\n+Foco no cliente"),
              ],
            ),
      Container(
        margin: SiteConfig.smallScreen
            ? const EdgeInsets.all(24)
            : const EdgeInsets.all(48),
        padding: SiteConfig.smallScreen
            ? const EdgeInsets.all(12)
            : const EdgeInsets.all(24),
        decoration: BoxDecoration(
          // color: Colors.white.withAlpha(150),
          color: SiteConfig.lightColors.primary.withAlpha(25),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Nossa equipe:",
                  style: TextStyle(
                      color: SiteConfig.lightColors.primary,
                      fontSize: SiteConfig.getHeadingSize()),
                )
              ],
            ),
            SiteConfig.smallScreen
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: ServiceContainer(
                            img: Image.asset("assets/images/paula/pity.jpg"),
                            text:
                                "Médica do trabalho, membro da Associação de medicina do trabalho, especialista em Perícias médicas pela Fundação Unimed e MBA em Gestão empresarial pela FGV."
                                "Com mais de 12 anos de experiencia na área de saúde ocupacional, de empresas nas áreas de Indústria Química e Petroquímica, "
                                "Construção civil, Bancário, Portuária, Mineração, Varejo e atacado. Atuou em grandes empresas, como: Braskem, Banco do Brasil, Grupo Unigel, Walmart, Grupo Big, Grupo Carrefour, entre outras. Além de atuação como perita judicial."
                                "",
                            title: "Dra. Priscila Merces"),
                      ),
                      Flexible(
                        child: ServiceContainer(
                            img: Image.asset(
                                "assets/images/paula/engenheiraSeg.jpeg"),
                            text:
                                "Engenheira de Produção, especialista em segurança do trabalho e formação em higiene ocupacional."
                                "Com mais de 12 anos de experiencia nas áreas de Indústria Química e Petroquímica, Construção civil, Indústria de alimentos., Hospitalar, saúde ocupacional, entre outras. Além de atuação como Professor docente no Senai.",
                            title: "Eng. Rosana Luz"),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: SiteConfig.screenSize.height * 0.55,
                        width: SiteConfig.screenSize.width * 0.45,
                        child: ServiceContainer(
                            img: Image.asset("assets/images/paula/pity.jpg"),
                            text:
                                "Médica do trabalho, membro da Associação de medicina do trabalho, especialista em Perícias médicas pela Fundação Unimed e MBA em Gestão empresarial pela FGV."
                                "Com mais de 12 anos de experiencia na área de saúde ocupacional, de empresas nas áreas de Indústria Química e Petroquímica, "
                                "Construção civil, Bancário, Portuária, Mineração, Varejo e atacado. Atuou em grandes empresas, como: Braskem, Banco do Brasil, Grupo Unigel, Walmart, Grupo Big, Grupo Carrefour, entre outras. Além de atuação como perita judicial."
                                "",
                            title: "Dra. Priscila Merces"),
                      ),
                      SizedBox(
                        height: SiteConfig.screenSize.height * 0.55,
                        width: SiteConfig.screenSize.width * 0.45,
                        child: ServiceContainer(
                            img: Image.asset(
                                "assets/images/paula/engenheiraSeg.jpeg"),
                            text:
                                "Engenheira de Produção, especialista em segurança do trabalho e formação em higiene ocupacional."
                                "Com mais de 12 anos de experiencia nas áreas de Indústria Química e Petroquímica, Construção civil, Indústria de alimentos., Hospitalar, saúde ocupacional, entre outras. Além de atuação como Professor docente no Senai.",
                            title: "Eng. Rosana Luz"),
                      ),
                    ],
                  ),
          ],
        ),
      ),
      SizedBox(
        height: 100,
      ),
    ];

    return Scaffold(
      appBar: SiteConfig.getAppBar(context, widget.title),
      floatingActionButton: SiteConfig.getFAB(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/paula/p2pLogoEscrito.png",
              fit: BoxFit.fitWidth,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  height: SiteConfig.screenSize.width * 4 / 15,
                  child: Stack(
                    children: [
                      CarouselSlider(
                        carouselController: carouselController,
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: SiteConfig.screenSize.width * 4 / 15,
                        ),
                        items: [
                          Image.asset(
                              "assets/images/serviços/CarretelEsocial.png",
                              fit: BoxFit.fitWidth),

                          // ignore: prefer_const_constructors

                          Image.asset(
                            "assets/images/serviços/CarretelConfuso.png",
                            fit: BoxFit.fitWidth,
                          ),

                          // ignore: prefer_const_constructors
                          Image.asset(
                              "assets/images/serviços/VamosProteger.png",
                              fit: BoxFit.fitWidth),
                        ].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: SiteConfig.screenSize.width,
                                child: i,
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withAlpha(50),
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                            iconSize: 50,
                            onPressed: () {
                              // Use the controller to change the current page
                              carouselController.previousPage();
                            },
                            icon: Icon(Icons.arrow_back),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withAlpha(50),
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                            iconSize: 50,
                            onPressed: () {
                              // Use the controller to change the current page
                              carouselController.nextPage();
                            },
                            icon: Icon(Icons.arrow_forward),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                //  CarouselSlider.builder(
                //   options: CarouselOptions(
                //     height: SiteConfig.smallScreen
                //         ? SiteConfig.screenSize.width * 0.8
                //         : SiteConfig.screenSize.width * 0.2,
                //     enableInfiniteScroll: true,
                //     autoPlay: true,
                //     autoPlayInterval: const Duration(seconds: 4),
                //   ),
                //   itemCount: SiteConfig.smallScreen ? 1 : 1,
                //   itemBuilder: (BuildContext context, int index, int realIndex) {
                //     return SiteConfig.smallScreen
                //         ? Row(
                //             children: [carouselImages[index]],
                //           )
                //         : index == 0
                //             ? Row(
                //                 children: [
                //                   carouselImages[0],
                //                   carouselImages[1],
                //                   carouselImages[2],
                //                 ],
                //               )
                //             : Row(
                //                 children: [
                //                   carouselImages[3],
                //                   carouselImages[4],
                //                   carouselImages[5],
                //                   carouselImages[6],
                //                 ],
                //               );
                //   },
                // ),
                ),
            Container(
                color: SiteConfig.lightColors.secondary,
                // height: SiteConfig.smallScreen
                //     ? SiteConfig.screenSize.height * 1.5
                //     : SiteConfig.screenSize.height * 0.8,
                width: SiteConfig.screenSize.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: greenRectangle,
                )),
            SiteConfig.getFooter(),
          ],
        ),
      ),
    );
  }
}
