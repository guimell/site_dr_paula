import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Blog.getBlog();
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dr. Paula',
      theme: ThemeData.from(colorScheme: SiteConfig.lightColors),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
