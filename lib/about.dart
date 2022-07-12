import 'widgets.dart';
import 'package:flutter/material.dart';

import 'config.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);
  @override
  State<AboutPage> createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    SiteConfig.screenHeight = MediaQuery.of(context).size.height;
    SiteConfig.screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: SiteConfig.getAppBar(context, "Sobre mim"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AboutBlock(
              text: "SOU UMA PESOA BOA",
              color: Colors.amber.withAlpha(20),
            ),
            AboutBlock(
              text: "EU JURO!",
              color: Colors.purple.withAlpha(20),
            ),
            AboutBlock(
              text: "100% PODE CREER",
              color: Colors.amber.withAlpha(20),
            ),
          ],
        ),
      ),
    );
  }
}
