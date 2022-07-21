import 'package:intl/intl.dart';
import 'package:html/parser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;

import 'widgets.dart';
import 'screens/blog.dart';
import 'screens/home.dart';
import 'screens/contact.dart';
import 'screens/services.dart';

class SiteConfig {
  //Screen size
  static double screenWidth = 0;
  static double screenHeight = 0;
  static bool smallScreen = false;

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

  static ButtonStyle buttonStyle = ButtonStyle(
    minimumSize: MaterialStateProperty.all(const Size(100, 50)),
    maximumSize: MaterialStateProperty.all(const Size(150, 100)),
  );

  static bool local = true;

  static AppBar getAppBar(BuildContext context, String title) {
    const int navButtonsWidth = 775;
    final List<Widget> navigationButtons = [
      AppBarButton(
        text: "Home",
        page: const HomePage(),
        autofocus: title == "Home",
      ),
      AppBarButton(
        text: "Services",
        page: const ServicesPage(),
        autofocus: title == "Services",
      ),
      AppBarButton(
        text: "Blog",
        page: const BlogPage(),
        autofocus: title == "Blog",
      ),
      AppBarButton(
        text: "Contato",
        page: const ContactPage(),
        autofocus: title == "Contato",
      ),
    ];
    return AppBar(
      elevation: 8,
      shadowColor: lightColors.primary.withAlpha(100),
      toolbarHeight: 70,
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.primary,
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
          const Text('Dra. Paula Brasil'),
        ],
      ),
      leading: screenWidth < navButtonsWidth
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
        screenWidth < navButtonsWidth
            ? const SizedBox()
            : Row(children: navigationButtons),
        IconButton(
          icon: const Icon(Icons.mark_email_unread_rounded),
          onPressed: () {},
        ),
      ],
    );
  }

  static Widget getFAB() {
    return SizedBox(
      height: 100.0,
      width: 100.0,
      child: FittedBox(
        child: FloatingActionButton(
          foregroundColor: lightColors.background,
          backgroundColor: lightColors.primary,
          onPressed: (() async {
            String phone = "557188078855";
            String text = Uri.encodeFull("Ola Dr. Paula!");
            Uri uri = Uri.parse("https://wa.me/$phone?text=$text");
            tryLaunchUri(uri);
          }),
          child: const Icon(
            Icons.whatsapp_rounded,
            size: 40,
          ),
        ),
      ),
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
    final double sizeI = 20 + screenWidth / 100;
    List<Widget> children = [
      Expanded(
        flex: smallScreen ? 1 : 1,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            "assets/images/paula/logoMarca.jpeg",
            fit: BoxFit.contain,
            height: sizeI * 10,
            width: sizeI * 10,
          ),
        ),
      ),
      Expanded(
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Uri uri = Uri.parse("https://www.instagram.com/drapaulabrasil/");
            tryLaunchUri(uri);
          },
          icon: FaIcon(
            FontAwesomeIcons.instagram,
            color: SiteConfig.lightColors.primary,
            size: sizeI,
          ),
        ),
      ),
      Expanded(
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Uri uri = Uri.parse("https://www.twitter.com");
            tryLaunchUri(uri);
          },
          icon: FaIcon(
            FontAwesomeIcons.twitter,
            color: SiteConfig.lightColors.primary,
            size: sizeI,
          ),
        ),
      ),
      Expanded(
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Uri uri = Uri.parse("https://www.facebook.com/prbrasil");
            tryLaunchUri(uri);
          },
          icon: FaIcon(
            FontAwesomeIcons.facebook,
            color: SiteConfig.lightColors.primary,
            size: sizeI,
          ),
        ),
      ),
      const Expanded(
        flex: 2,
        child: SizedBox(),
      ),
    ];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: sizeI * 4,
      width: screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }

  static Future<void> tryLaunchUri(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  static void showSnackBar(BuildContext context, String text, bool good) {
    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor:
          good ? SiteConfig.lightColors.primary : SiteConfig.lightColors.error,
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
    if (response.body == "OK") {
      return true;
    }
    return false;
  }
}

class Post {
  final String id;
  final String url;
  final String title;
  final String authorName;
  late String published;
  late String updated;
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
    required this.updated,
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
    // format date
    DateTime date = DateTime.parse(published);
    published = DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br').format(date);
    date = DateTime.parse(updated);
    updated = DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br').format(date);
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
            updated: post["updated"] ??= "",
            url: post["url"] ??= "",
            title: post["title"] ??= "",
            content: post["content"] ??= "",
            authorName: post["author"]["displayName"] ??= "",
          ),
        );
      }
    } else {}
  }
}
