import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:site_dr_paula/config.dart';
import 'widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'config.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final String title = "Home";

  @override
  Widget build(BuildContext context) {
    SiteConfig.screenHeight = MediaQuery.of(context).size.height;
    SiteConfig.screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: SiteConfig.getAppBar(context, title),
      floatingActionButton: SiteConfig.getFAB(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 900,
              width: 3000,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset("assets/images/paula/paulaBanner.jpg"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 117),
              child: CarouselSlider(
                options:
                    CarouselOptions(height: 400.0, enableInfiniteScroll: false),
                items: [
                  Image.asset("assets/images/paula/paulaMesa.jpg"),
                  Image.asset("assets/images/paula/paulaPerfil.jpg"),
                  Image.asset("assets/images/paula/paulaBanner.jpg"),
                  Image.asset("assets/images/paula/logoMarca.jpeg")
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 1),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 216, 45, 45)),
                          child: i);
                    },
                  );
                }).toList(),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: SiteConfig.screenHeight * 0.9,
                  width: SiteConfig.screenWidth * 0.4,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Image.asset("assets/images/paula/paulaPerfil.jpg"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color:
                        const Color.fromARGB(255, 175, 127, 75).withAlpha(200),
                  ),
                  height: SiteConfig.screenHeight * 0.2,
                  width: SiteConfig.screenWidth / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Dr.Paula",
                        style: TextStyle(fontSize: 20),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Sou Dra Paula Roberta Brasil, graduada em Odontologia há 16 anos e no decorrer desse tempo,"
                          " venho realizando diversos cursos de atualização,"
                          " especialização e também mestrado com fins de oferecer o melhor serviço para meus pacientes,"
                          " ou seja, você que está visitando minha página! \n\n"
                          "Sou apaixonada pela estética desde minha infância,"
                          " por isso encontrar a sua melhor versão será um grande prazer e uma imensa alegria. Minha maior ESPECIALIDADE é deixar você mais BONITA e NATURAL,"
                          " através da HARMONIZAÇÃO OROFACIAL.",
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SiteConfig.getFooter(),
          ],
        ),
      ),
    );
  }
}
