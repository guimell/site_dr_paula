import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:site_dr_paula/config.dart';
import 'widgets.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'config.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final String title = "Home";

  @override
  Widget build(BuildContext context) {
    SiteConfig.screenHeight = MediaQuery.of(context).size.height;
    SiteConfig.screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: SiteConfig.getAppBar(context, title),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 900,
              width: 3000,
              child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset("assets/images/paula/paulaBanner.jpg")),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 117),
              child: CarouselSlider(
                options: CarouselOptions(height: 400.0),
                items: [1, 2, 3, 4, 5, 7].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 216, 45, 45)),
                          child: Text(
                            'text $i',
                            style: const TextStyle(fontSize: 16.0),
                          ));
                    },
                  );
                }).toList(),
              ),
            ),
            ResponsiveRowColumn(
              rowMainAxisAlignment: MainAxisAlignment.center,
              rowPadding: const EdgeInsets.all(30),
              columnPadding: const EdgeInsets.all(30),
              layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              children: [
                ResponsiveRowColumnItem(
                  child: Row(
                    children: [
                      SizedBox(
                        height: SiteConfig.screenHeight * 1.5,
                        width: SiteConfig.screenWidth * 0.4,
                        child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Image.asset(
                                "assets/images/paula/paulaPerfil.jpg")),
                      ),
                      Container(
                        height: SiteConfig.screenHeight * 0.5,
                        width: SiteConfig.screenWidth / 2,
                        color: Colors.amber,
                      )
                    ],
                  ),
                )
              ],
            ),
            const Text(
              "Ajudo a melhorar sua auto-estima através de uma cirurgia plástica segura.",
              style: TextStyle(fontSize: 40),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Sou uma otima medica, pode confiar",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  child: Image.asset("assets/images/paula/paulaMesa.jpg"),
                ),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: const [
                        Text("data"),
                        Text("data"),
                        Text("data"),
                        Text("data"),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Sou uma otima medica, pode confiar",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SiteConfig.getFooter(),
          ],
        ),
      ),
    );
  }
}
