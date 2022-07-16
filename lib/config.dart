import 'package:html/parser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lorem_ipsum/lorem_ipsum.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;

import 'blog.dart';
import 'home.dart';
import 'about.dart';
import 'contact.dart';
import 'widgets.dart';
import 'services.dart';

class SiteConfig {
  //Screen size
  static double screenWidth = 0;
  static double screenHeight = 0;

  // theme colors
  static ColorScheme lightColors = const ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromARGB(255, 175, 127, 75),
    onPrimary: Colors.white,
    secondary: Color(0xff03dac6),
    onSecondary: Colors.black,
    error: Color(0xffb00020),
    onError: Colors.white,
    background: Color.fromARGB(255, 237, 237, 237),
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  );
  static ColorScheme darkColors = const ColorScheme(
    brightness: Brightness.dark,
    primary: Color.fromARGB(255, 175, 127, 75),
    onPrimary: Colors.black,
    secondary: Color(0xff03dac6),
    onSecondary: Colors.black,
    error: Color(0xffcf6679),
    onError: Colors.black,
    background: Color(0xff121212),
    onBackground: Colors.white,
    surface: Color(0xff121212),
    onSurface: Colors.white,
  );

  static AppBar getAppBar(BuildContext context, String title) {
    List<Widget> navigationButtons = [
      TextButton(
        autofocus: title == "Home",
        onPressed: () {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const HomePage(),
              settings: const RouteSettings(name: "/Home"),
              reverseTransitionDuration: Duration.zero,
              transitionDuration: Duration.zero,
            ),
          );
        },
        child: const Text("Home"),
      ),
      TextButton(
        autofocus: title == "Blog",
        onPressed: () {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const BlogPage(),
              settings: const RouteSettings(name: "/Blog"),
              reverseTransitionDuration: Duration.zero,
              transitionDuration: Duration.zero,
            ),
          );
        },
        child: const Text("Blog"),
      ),
      TextButton(
        autofocus: title == "Contato",
        onPressed: () {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const ContactPage(),
              settings: const RouteSettings(name: "/Contato"),
              reverseTransitionDuration: Duration.zero,
              transitionDuration: Duration.zero,
            ),
          );
        },
        child: const Text("Contato"),
      ),
      TextButton(
        autofocus: title == "Services",
        onPressed: () {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const ServicesPage(),
              settings: const RouteSettings(name: "/Services"),
              reverseTransitionDuration: Duration.zero,
              transitionDuration: Duration.zero,
            ),
          );
        },
        child: const Text("Services"),
      ),
      TextButton(
        autofocus: title == "Sobre mim",
        onPressed: () {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const AboutPage(),
              settings: const RouteSettings(name: "/Sobre-mim"),
              reverseTransitionDuration: Duration.zero,
              transitionDuration: Duration.zero,
            ),
          );
        },
        child: const Text("Sobre mim"),
      ),
    ];

    return AppBar(
      toolbarHeight: 70,
      backgroundColor: lightColors.background,
      foregroundColor: lightColors.primary,
      centerTitle: true,
      title: Row(
        children: [
          SizedBox(
            height: 60,
            child: Image.asset(
              "assets/images/paula/logoMarcaT.png",
              fit: BoxFit.contain,
            ),
          ),
          const Text('Dr. Paula'),
        ],
      ),
      leading: screenHeight > screenWidth
          ? IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => BackdropFilter(
                    filter: ui.ImageFilter.blur(
                      sigmaX: 8.0,
                      sigmaY: 8.0,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: navigationButtons,
                      ),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.menu),
            )
          : null,
      actions: [
        screenHeight > screenWidth
            ? const SizedBox()
            : Row(children: navigationButtons),
        IconButton(
          icon: const Icon(Icons.mark_email_unread_rounded),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.logout_rounded),
          onPressed: () {},
        ),
      ],
    );
  }

  static Widget getFAB() {
    return FloatingActionButton(
      // foregroundColor: const Color.fromARGB(255, 175, 127, 75),
      backgroundColor: const Color.fromARGB(255, 175, 127, 75),
      child: Icon(Icons.chat),
      onPressed: (() {
        print("object");
      }),
    );
  }

  static Widget getHeader(BuildContext context, String title) {
    List<Widget> navigationButtons = [
      TextButton(
        autofocus: title == "Home",
        // style: buttonStyle,
        onPressed: () {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const HomePage(),
              settings: const RouteSettings(name: "/Home"),
              reverseTransitionDuration: Duration.zero,
              transitionDuration: Duration.zero,
            ),
          );
        },
        child: const Text("Home"),
      ),
      TextButton(
        autofocus: title == "Blog",
        // style: buttonStyle,
        onPressed: () {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const BlogPage(),
              settings: const RouteSettings(name: "/Blog"),
              reverseTransitionDuration: Duration.zero,
              transitionDuration: Duration.zero,
            ),
          );
        },
        child: const Text("Blog"),
      ),
      TextButton(
        autofocus: title == "Contato",
        // style: buttonStyle,
        onPressed: () {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const ContactPage(),
              settings: const RouteSettings(name: "/Contato"),
              reverseTransitionDuration: Duration.zero,
              transitionDuration: Duration.zero,
            ),
          );
        },
        child: const Text("Contato"),
      ),
      TextButton(
        autofocus: title == "Services",
        // style: buttonStyle,
        onPressed: () {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const ServicesPage(),
              settings: const RouteSettings(name: "/Services"),
              reverseTransitionDuration: Duration.zero,
              transitionDuration: Duration.zero,
            ),
          );
        },
        child: const Text("Services"),
      ),
      TextButton(
        autofocus: title == "Sobre mim",
        // style: buttonStyle,
        onPressed: () {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const AboutPage(),
              settings: const RouteSettings(name: "/Sobre-mim"),
              reverseTransitionDuration: Duration.zero,
              transitionDuration: Duration.zero,
            ),
          );
        },
        child: const Text("Sobre mim"),
      ),
    ];

    return Container(
      height: screenHeight * 0.05 + 20,
      width: screenWidth,
      color: const Color.fromARGB(255, 175, 127, 75).withAlpha(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          screenHeight > screenWidth
              ? IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => BackdropFilter(
                        filter: ui.ImageFilter.blur(
                          sigmaX: 8.0,
                          sigmaY: 8.0,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: navigationButtons,
                          ),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.menu),
                )
              : Row(children: navigationButtons),
          IconButton(
            icon: const Icon(Icons.mark_email_unread_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  static Widget getFooter() {
    int words = 40;
    double sizeH = 200;
    double sizeW = 200;
    final bool smallScreen = sizeW * 4.5 > screenWidth;
    List<Widget> children = [
      Container(
        height: sizeH,
        width: sizeW,
        margin: const EdgeInsets.all(8),
        child: Image.asset(
          "assets/images/paula/logoMarca.jpeg",
          fit: BoxFit.contain,
        ),
      ),
      Container(
        height: sizeH,
        width: sizeW,
        margin: const EdgeInsets.all(8),
        child: Center(child: Text(loremIpsum(words: words))),
      ),
      Container(
        height: sizeH,
        width: sizeW,
        margin: const EdgeInsets.all(8),
        child: Center(child: Text(loremIpsum(words: words))),
      ),
      Container(
        height: sizeH,
        width: sizeW,
        margin: const EdgeInsets.all(8),
        child: Center(child: Text(loremIpsum(words: words))),
      ),
    ];
    return smallScreen
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          )
        : Column(
            children: [
              SizedBox(height: screenHeight * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            ],
          );
  }

  static Widget getFooter2() {
    return Container(
      height: SiteConfig.screenHeight * 0.25,
      width: SiteConfig.screenWidth,
      color: Colors.grey.withAlpha(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(
              height: 200,
              width: 200,
              child: Column(
                children: [
                  const Text(
                    "Redes sociais",
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.photo_camera),
                      Text(" Instagram")
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.facebook_rounded),
                      Text(" Facebook")
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.airplanemode_active),
                      Text(" Twitter")
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 200,
            width: 200,
            child: Column(
              children: [
                const Text(
                  "Contato",
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.phone_android),
                      Text(
                        " 71-9991-1325",
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: const [
                      Icon(Icons.email_rounded),
                      Text(
                        " exemplo@hotmail.com",
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: const [
                      Icon(Icons.location_on),
                      Text(" Salvador-BA"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: const [
                      Icon(Icons.home),
                      Text(" Rua praia dos santos"),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              children: const [
                Text(
                  "Alguma coisa",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text),
    );
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static Future<bool> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    const serviceID = 'service_5io0bdq';
    const templateID = 'template_ksmrhks';
    const userID = '7HSzBI9HYk-Fk7Ye3';

    final uri = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final response = await http.post(
      uri,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        "service_id": serviceID,
        "template_id": templateID,
        "user_id": userID,
        "template_params": {
          "user_name": name,
          "user_email": email,
          "user_subject": subject,
          "user_message": message,
        },
      }),
    );
    print(response.body);
    if (response.body == "OK") {
      return true;
    }
    return false;
  }
}

class Post {
  final String id;
  final String published;
  final String url;
  final String title;
  final String authorName;
  late String content;
  late String image;

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    return parsedString;
  }

  bool contains(String keywords) {
    if (title.toLowerCase().contains(keywords)) {
      return true;
    } else if (content.toLowerCase().contains(keywords)) {
      return true;
    } else if (authorName.toLowerCase().contains(keywords)) {
      return true;
    }
    return false;
  }

  Post({
    required this.id,
    required this.published,
    required this.url,
    required this.title,
    required this.authorName,
    required this.content,
  }) {
    // find image path
    int imgIndex = content.indexOf('src="');
    if (imgIndex >= 0) {
      imgIndex += 5;
      String imagePath = content.substring(imgIndex);
      imagePath = imagePath.substring(0, imagePath.indexOf('"'));
      image = imagePath;
    } else {
      image = "";
    }
    // text content
    content = _parseHtmlString(content);
  }
}

class Blog {
  static const String apiKey = "AIzaSyADhFrefjuOoDgHeQZsp2Twilx031KWGKk";
  static const String blogID = "476912652482766745";
  static final Uri uri = Uri.parse(
    "https://www.googleapis.com/blogger/v3/blogs/$blogID/posts?key=$apiKey",
  );

  static int id = 0;
  static List<Post> posts = [];

  static Future<void> getBlog() async {
    http.Response response = await http.get(uri);
    var jsonData = jsonDecode(response.body);
    // print(jsonData);

    if (jsonData != null) {
      posts = [];
      for (var post in jsonData["items"]) {
        posts.add(
          Post(
            id: post["id"] ??= "",
            published: post["published"] ??= "",
            url: post["url"] ??= "",
            title: post["title"] ??= "",
            content: post["content"] ??= "",
            authorName: post["author"]["displayName"] ??= "",
          ),
        );
      }
    } else {
      print("NULL JSONDATA");
    }

    // for (Post post in posts) {
    //   print(post.id);
    //   print(post.published);
    //   print(post.url);
    //   print(post.title);
    //   print(post.content);
    //   print(post.authorName);
    // }
  }
}
