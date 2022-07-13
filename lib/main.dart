import 'package:flutter/material.dart';
import 'config.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'home.dart';

void main() => runApp(const AppWidget());

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: const [
          ResponsiveBreakpoint.resize(350, name: MOBILE),
          ResponsiveBreakpoint.autoScale(600, name: TABLET),
          ResponsiveBreakpoint.resize(800, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
        ],
      ),
      title: 'Flutter Responsive Framework',
      theme: ThemeData.from(colorScheme: SiteConfig.lightColors),
      darkTheme: ThemeData.from(colorScheme: SiteConfig.darkColors),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
