import 'package:flutter/material.dart';
import 'blog.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'dart:async';

import 'about.dart';
import 'home.dart';
import 'contact.dart';
import 'widgets.dart';

class SiteConfig {
  //Screen size
  static StreamController<List<double>> screenSizeStreamController =
      StreamController<List<double>>.broadcast();
  static double screenWidth = 0;
  static double screenHeight = 0;

  // theme colors
  static ColorScheme lightColors = const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff6200ee),
    onPrimary: Colors.white,
    secondary: Color(0xff03dac6),
    onSecondary: Colors.black,
    error: Color(0xffb00020),
    onError: Colors.white,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  );

  static ColorScheme darkColors = const ColorScheme(
    brightness: Brightness.dark,
    primary: Color.fromARGB(255, 172, 136, 206),
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
  //AppBar
  static AppBar getAppBar(BuildContext context, String title) {
    return AppBar(
      centerTitle: true,
      title: const AppBarTitle(),
      leading: ResponsiveVisibility(
        hiddenWhen: const [Condition.largerThan(name: TABLET)],
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
      ),
      actions: [
        ResponsiveVisibility(
          visible: false,
          visibleWhen: const [Condition.largerThan(name: TABLET)],
          child: TextButton(
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
        ),
        ResponsiveVisibility(
          visible: false,
          visibleWhen: const [Condition.largerThan(name: TABLET)],
          child: TextButton(
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
              child: const Text("Blog")),
        ),
        ResponsiveVisibility(
          visible: false,
          visibleWhen: const [Condition.largerThan(name: TABLET)],
          child: TextButton(
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
              child: const Text("Contato")),
        ),
        ResponsiveVisibility(
          visible: false,
          visibleWhen: const [Condition.largerThan(name: TABLET)],
          child: TextButton(
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
              child: const Text("Sobre mim")),
        ),
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
}
