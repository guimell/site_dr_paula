import 'package:lorem_ipsum/lorem_ipsum.dart';

import 'widgets.dart';
import 'package:flutter/material.dart';

import 'config.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);
  @override
  State<ServicesPage> createState() => ServicesPageState();
}

class ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    SiteConfig.screenHeight = MediaQuery.of(context).size.height;
    SiteConfig.screenWidth = MediaQuery.of(context).size.width;

    bool smallScreen = SiteConfig.screenHeight > SiteConfig.screenWidth;

    List<Widget> children = [
      const Text(
        "What We Can Provide For You",
        style: TextStyle(fontSize: 30),
      ),
      ContentBlock(
        title: "Service 1",
        text: loremIpsum(paragraphs: 1, words: 100),
      ),
      ContentBlock(
        title: "Service 2",
        text: loremIpsum(paragraphs: 1, words: 100),
      ),
      ContentBlock(
        title: "Service 3",
        text: loremIpsum(paragraphs: 1, words: 100),
      ),
      ContentBlock(
        title: "Service 4",
        text: loremIpsum(paragraphs: 1, words: 100),
      ),
      ContentBlock(
        title: "Service 5",
        text: loremIpsum(paragraphs: 1, words: 100),
      ),
      ContentBlock(
        title: "Service 6",
        text: loremIpsum(paragraphs: 1, words: 100),
      ),
      ContentBlock(
        title: "Service 7",
        text: loremIpsum(paragraphs: 1, words: 100),
      ),
      ContentBlock(
        title: "Service 8",
        text: loremIpsum(paragraphs: 1, words: 100),
      ),
    ];

    return Scaffold(
      appBar: SiteConfig.getAppBar(context, "Services"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: smallScreen
              ? children
              : [
                  children[0],
                  Row(children: [children[1], children[2]]),
                  Row(children: [children[3], children[4]]),
                  Row(children: [children[5], children[6]]),
                  Row(children: [children[7], children[8]]),
                ],
        ),
      ),
    );
  }
}
