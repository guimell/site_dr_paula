import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:transparent_image/transparent_image.dart';

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
      padding: const EdgeInsets.all(5),
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
        child: Text(text),
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

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Image(
          width: 800,
          color: Color.fromRGBO(255, 255, 255, 0.5),
          colorBlendMode: BlendMode.modulate,
          image: AssetImage('assets/images/header_image.png'),
        ),
        Text(
          'Our Courses',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30 + SiteConfig.screenWidth * 0.01,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class SubscribeBlock extends StatelessWidget {
  const SubscribeBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Want to learn more?\nSubscribe to our newsletter!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 80,
                vertical: 20,
              ),
            ),
            onPressed: () {},
            child: const Text('SUBSCRIBE'),
          ),
        )
      ],
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
      Icon(widget.icon, size: 125),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            widget.title!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            widget.text,
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

    double width = SiteConfig.screenWidth;
    if (widget.rowCol) {
      width = SiteConfig.screenHeight > SiteConfig.screenWidth
          ? SiteConfig.screenWidth
          : SiteConfig.screenWidth * .4;
    }

    return MouseRegion(
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
        height: 250,
        width: width,
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
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
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
    final bool smallScreen = SiteConfig.screenHeight > SiteConfig.screenWidth;
    final double width = smallScreen
        ? SiteConfig.screenWidth * 0.8
        : SiteConfig.screenWidth * 0.8 / 3;
    return Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(8),
      //   color: SiteConfig.lightColors.primary.withAlpha(25),
      // ),
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(10.0),
      height: SiteConfig.screenHeight,
      width: width,
      child: Column(
        children: [
          // image section
          SiteConfig.screenHeight < 400
              ? const SizedBox()
              : Expanded(
                  flex: 8,
                  child: Stack(
                    children: [
                      const Center(child: CircularProgressIndicator()),
                      Center(
                        child: post.image == ""
                            ? Image.asset(
                                "assets/images/nope/service_temp.png",
                                fit: BoxFit.cover,
                              )
                            : FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: post.image,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ],
                  ),
                ),
          // title section
          Expanded(
            flex: 4,
            child: Text(
              post.title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // text section
          SiteConfig.screenHeight < 600
              ? const SizedBox()
              : Expanded(
                  flex: 8,
                  child: Text(
                    post.content,
                    style: TextStyle(
                      color: Colors.grey.withAlpha(200),
                    ),
                  ),
                ),
          // info section
          Container(
            padding: const EdgeInsets.only(top: 8),
            width: width - 16,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.authorName),
                Text(post.published),
                // Text(post.updated),
                ElevatedButton(
                  onPressed: () {
                    Uri uri = Uri.parse(post.url);
                    SiteConfig.tryLaunchUri(uri);
                  },
                  child: const Text("Read More!"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyContainerService extends StatelessWidget {
  final String text;
  final String title;
  const MyContainerService(
    this.title,
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        width: SiteConfig.screenWidth * 0.7,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 40,
                  color: Color.fromARGB(255, 175, 127, 75),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                  height: 400.0, enableInfiniteScroll: true, autoPlay: true),
              items: [
                Image.asset("assets/images/serviços/pdo.jpg"),
                Image.asset(
                  "assets/images/serviços/pdo1.webp",
                  fit: BoxFit.fitWidth,
                ),
                Image.asset("assets/images/serviços/pdo2.jpg"),
                Image.asset("assets/images/serviços/pdo3.png")
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 1),
                        child: i);
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
  final List<String> items;
  const CarouselItem({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool smallScreen = SiteConfig.screenWidth < SiteConfig.screenHeight;
    return Container(
      // child: Padding(
      //   padding: EdgeInsets.symmetric(
      //     horizontal: smallScreen ? 50 : 200,
      //     vertical: 10,
      //   ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                onHover: (_) {},
                child: Image.asset(items[0]),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                onHover: (_) {},
                child: Image.asset(items[1]),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                onHover: (_) {},
                child: Image.asset(items[2]),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                onHover: (_) {},
                child: Image.asset(items[3]),
              ),
            ),
          ),
        ],
        // ),
      ),
    );
  }
}
