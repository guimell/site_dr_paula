import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config.dart';
import 'home.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Blog.getBlog();
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // builder: (context, widget) => ResponsiveWrapper.builder(
      //   ClampingScrollWrapper.builder(context, widget!),
      //   breakpoints: const [
      //     ResponsiveBreakpoint.resize(350, name: MOBILE),
      //     ResponsiveBreakpoint.resize(600, name: TABLET),
      //     ResponsiveBreakpoint.resize(800, name: DESKTOP),
      //     ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
      //   ],
      // ),
      title: 'Flutter Responsive Framework',
      theme: ThemeData.from(colorScheme: SiteConfig.lightColors),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
