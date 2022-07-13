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
      SizedBox(
        height: SiteConfig.screenHeight / 2,
        width: SiteConfig.screenWidth,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/nope/service_temp.png",
                opacity: const AlwaysStoppedAnimation<double>(100),
                fit: BoxFit.fitWidth,
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "What We Can Provide For You",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
      InteractiveContent(
        title: "Service 1",
        text: loremIpsum(paragraphs: 1, words: 100),
        icon: Icons.access_alarm_rounded,
      ),
      InteractiveContent(
        title: "Service 2",
        text: loremIpsum(paragraphs: 1, words: 100),
        icon: Icons.access_alarm_rounded,
      ),
      InteractiveContent(
        title: "Service 3",
        text: loremIpsum(paragraphs: 1, words: 100),
        icon: Icons.access_alarm_rounded,
      ),
      InteractiveContent(
        title: "Service 4",
        text: loremIpsum(paragraphs: 1, words: 100),
        icon: Icons.access_alarm_rounded,
      ),
      InteractiveContent(
        title: "Service 5",
        text: loremIpsum(paragraphs: 1, words: 100),
        icon: Icons.access_alarm_rounded,
      ),
      InteractiveContent(
        title: "Service 6",
        text: loremIpsum(paragraphs: 1, words: 100),
        icon: Icons.access_alarm_rounded,
      ),
      InteractiveContent(
        title: "Service 7",
        text: loremIpsum(paragraphs: 1, words: 100),
        icon: Icons.access_alarm_rounded,
      ),
      InteractiveContent(
        title: "Service 8",
        text: loremIpsum(paragraphs: 1, words: 100),
        icon: Icons.access_alarm_rounded,
      ),
    ];

    SizedBox spacer = SizedBox(width: SiteConfig.screenWidth * 0.1 - 16);

    return Scaffold(
      // appBar: SiteConfig.getAppBar(context, "Services"),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: smallScreen
                ? [SiteConfig.getHeader(context, "Services")] +
                    children +
                    [SiteConfig.getFooter()]
                : [
                    SiteConfig.getHeader(context, "Services"),
                    children[0],
                    Row(children: [spacer, children[3], children[4]]),
                    Row(children: [spacer, children[5], children[6]]),
                    Row(children: [spacer, children[7], children[8]]),
                    SiteConfig.getFooter(),
                  ],
          ),
        ),
      ),
    );
  }
}
