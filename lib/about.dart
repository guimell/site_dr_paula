import 'package:lorem_ipsum/lorem_ipsum.dart';

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
            InteractiveContent(
              text: loremIpsum(paragraphs: 2, words: 200),
              icon: Icons.access_alarm_rounded,
              rowCol: false,
            ),
            InteractiveContent(
              text: loremIpsum(paragraphs: 3, words: 300),
              icon: Icons.access_alarm_rounded,
              rowCol: false,
            ),
            InteractiveContent(
              text: loremIpsum(paragraphs: 2, words: 250),
              icon: Icons.access_alarm_rounded,
              rowCol: false,
            ),
            SiteConfig.getFooter(),
          ],
        ),
      ),
    );
  }
}
