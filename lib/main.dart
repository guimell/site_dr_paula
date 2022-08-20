import 'dart:developer';

import 'package:Dra_paula_brasil/screens/blog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'config.dart';
import 'screens/contact.dart';
import 'screens/home.dart';
import 'screens/services.dart';

// https://docs.flutter.dev/perf/rendering-performance

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initializeDateFormatting("pt_Br");
  Blog.getBlog();
  setUrlStrategy(PathUrlStrategy());
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (context) => HomePage(),
        ServicesPage.route: (context) => ServicesPage(),
        BlogPage.route: (context) => BlogPage(),
        ContactPage.route: (context) => ContactPage(),
      },
      title: 'Dr. Paula',
      theme: ThemeData.from(colorScheme: SiteConfig.lightColors),
      darkTheme: ThemeData.from(colorScheme: SiteConfig.darkColors),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
