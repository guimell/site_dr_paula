import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

import 'config.dart';
import 'screens/services.dart';

class AppBarButton extends StatelessWidget {
  final String text;
  final Widget page;
  final bool autofocus;
  const AppBarButton({
    Key? key,
    required this.text,
    required this.page,
    required this.autofocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextButton(
        style: SiteConfig.buttonStyle,
        autofocus: autofocus,
        onPressed: () {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => page,
              settings: RouteSettings(name: "/$text"),
              reverseTransitionDuration: Duration.zero,
              transitionDuration: Duration.zero,
            ),
          );
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: SiteConfig.smallScreen
                ? SiteConfig.getHeadingSize() - 2.5 // overflow if not
                : SiteConfig.getTextSize() - 1,
            fontWeight: autofocus ? FontWeight.w600 : null,
          ),
        ),
      ),
    );
  }
}

class MenuTextButton extends StatelessWidget {
  final String text;
  const MenuTextButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
      onPressed: () {},
      child: Text(text),
    );
  }
}

class MyTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController myController;
  final Function(String)? onChanged;

  const MyTextField({
    Key? key,
    required this.labelText,
    required this.myController,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: myController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          labelText: labelText,
        ),
        onChanged: onChanged != null
            ? (text) {
                onChanged!(text);
              }
            : null,
      ),
    );
  }
}

class InteractiveContent extends StatefulWidget {
  final bool rowCol;
  final Image? image;
  final Color? color;
  final String? title;
  final String text;
  final IconData icon;

  const InteractiveContent({
    Key? key,
    this.rowCol = true,
    this.image,
    this.color,
    this.title,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => InteractiveContentState();
}

class InteractiveContentState extends State<InteractiveContent> {
  bool mouseOver = false;
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Icon(
        widget.icon,
        size: 125,
        color: SiteConfig.lightColors.onPrimary,
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            widget.title!,
            style: TextStyle(
              fontSize: SiteConfig.getHeadingSize(),
              fontWeight: FontWeight.bold,
              color: SiteConfig.lightColors.primary,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
                color: SiteConfig.lightColors.onPrimary,
                fontSize: SiteConfig.getTextSize()),
          ),
        ),
      ),
    ];

    if (widget.image != null) {
      children.add(
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(child: widget.image),
        ),
      );
    }

    double width = SiteConfig.screenSize.width;
    if (widget.rowCol) {
      width = SiteConfig.screenSize.height > SiteConfig.screenSize.width
          ? SiteConfig.screenSize.width
          : SiteConfig.screenSize.width * 0.3;
    }

    return SizedBox(
      height: 250,
      width: width,
      child: MouseRegion(
        onEnter: (_) => setState(() {
          mouseOver = true;
          scrollController.animateTo(
            scrollController.position.maxScrollExtent, // end
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        }),
        onExit: (_) => setState(() {
          mouseOver = false;
          scrollController.animateTo(
            0, // start
            duration: const Duration(milliseconds: 1000),
            curve: Curves.ease,
          );
        }),
        child: Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: mouseOver
                ? const Color.fromARGB(255, 175, 127, 75).withAlpha(100)
                : const Color.fromARGB(255, 175, 127, 75).withAlpha(50),
            borderRadius: BorderRadius.circular(8),
            boxShadow: mouseOver
                ? [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                    ),
                  ]
                : [],
          ),
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              controller: scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.amber.withAlpha(100),
        ),
        height: 250,
        width: 250,
      ),
    );
  }
}

class BlogPost extends StatelessWidget {
  final Post post;
  const BlogPost({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width =
        SiteConfig.smallScreen ? SiteConfig.screenSize.width * 0.8 : 400;
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(10.0),
      height: SiteConfig.screenSize.height,
      width: width,
      child: Column(
        children: [
          // image section
          SiteConfig.screenSize.height < 400
              ? const SizedBox()
              : Expanded(
                  flex: 8,
                  child: Stack(
                    children: [
                      const Center(child: CircularProgressIndicator()),
                      Center(
                        child: post.image == ""
                            ? Image.asset(
                                "assets/images/paula/logoMarca.jpeg",
                                fit: BoxFit.contain,
                              )
                            : FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: post.image,
                                fit: BoxFit.contain,
                                width: width,
                              ),
                      ),
                    ],
                  ),
                ),
          // title section
          Expanded(
            flex: 4,
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              const double textSize = 24;
              final int lines = (constraints.maxHeight / textSize).round() - 1;
              return Text(
                post.title,
                maxLines: lines <= 0 ? 1 : lines,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
          ),
          // text section
          SiteConfig.screenSize.height < 600
              ? const SizedBox()
              : Expanded(
                  flex: 8,
                  child: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    const double textSize = 15;
                    final int lines =
                        (constraints.maxHeight / textSize).round() - 3;
                    return Text(
                      post.content,
                      maxLines: lines <= 0 ? 1 : lines,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: textSize,
                        color: Colors.grey.withAlpha(200),
                      ),
                    );
                  }),
                ),
          // info section
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            width: width - 16,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text(post.authorName),
                Text(post.published),
                // Text(post.updated),
                ElevatedButton(
                  onPressed: () {
                    Uri uri = Uri.parse(post.url);
                    SiteConfig.tryLaunchUri(uri);
                  },
                  child: const Text("Ler mais!"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> tryLaunchUri(Uri uri) async {
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $uri';
  }
}

class ServiceContainer extends StatelessWidget {
  final String text;
  final Image? img;
  final String title;

  const ServiceContainer({
    this.img,
    required this.text,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: SiteConfig.smallScreen
          ? const EdgeInsets.all(24)
          : const EdgeInsets.all(48),
      padding: SiteConfig.smallScreen
          ? const EdgeInsets.all(12)
          : const EdgeInsets.all(24),
      decoration: BoxDecoration(
        // color: Colors.white.withAlpha(150),
        color: SiteConfig.lightColors.secondary,
        borderRadius: BorderRadius.circular(6),
      ),
      width: SiteConfig.screenSize.width * 0.7,
      child: SiteConfig.smallScreen
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SiteConfig.getHeadingSize(),
                      color: SiteConfig.lightColors.primary,
                    ),
                  ),
                ),
                null == img ? const SizedBox() : img!,
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    text,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: SiteConfig.lightColors.onPrimary),
                  ),
                ),
              ],
            )
          : Row(
              children: [
                null == img ? const SizedBox() : Expanded(flex: 2, child: img!),
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: SiteConfig.getHeadingSize(),
                            color: SiteConfig.lightColors.primary,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: Text(
                          text,
                          // style: const TextStyle(
                          //   fontSize: SiteConfig.getTextSize(),
                          // ),
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: SiteConfig.getTextSize(),
                            color: SiteConfig.lightColors.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class CarouselImage extends StatefulWidget {
  final String image;
  final String title;
  final int index;

  const CarouselImage({
    Key? key,
    required this.image,
    required this.title,
    required this.index,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => CarouselImageState();
}

class CarouselImageState extends State<CarouselImage> {
  bool animItem = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => ServicesPage(index: widget.index),
              settings: const RouteSettings(name: "/Serviços"),
              reverseTransitionDuration: Duration.zero,
              transitionDuration: Duration.zero,
            ),
          );
        },
        onHover: (hovering) {
          setState(() {
            animItem = hovering;
          });
        },
        child: AnimatedContainer(
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 250),
          padding: animItem
              ? const EdgeInsets.symmetric(horizontal: 0)
              : const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Expanded(
                flex: 12,
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: SiteConfig.screenSize.width,
                  // color: SiteConfig.lightColors.primary.withAlpha(200),
                  child: Align(
                    alignment: Alignment.center,
                    // child: Text(
                    //   widget.title,
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: SiteConfig.smallScreen
                    //         ? SiteConfig.screenSize.width / 75 + 16
                    //         : SiteConfig.screenSize.width / 75 + 2,
                    //     fontWeight: FontWeight.bold,
                    //     color: SiteConfig.lightColors.background,
                    //   ),
                    // ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
