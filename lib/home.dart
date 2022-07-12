import 'package:flutter/material.dart';
import 'widgets.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'Config.dart';
import 'courser_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final String title = "Home";

  @override
  Widget build(BuildContext context) {
    SiteConfig.screenSizeStreamController.add(
      [MediaQuery.of(context).size.height, MediaQuery.of(context).size.width],
    );
    List<Course> courses = Course.courses;
    return Scaffold(
      appBar: SiteConfig.getAppBar(context, title),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          const Center(child: PageHeader()),
          const SizedBox(
            height: 30,
          ),
          ResponsiveRowColumn(
            rowMainAxisAlignment: MainAxisAlignment.center,
            rowPadding: const EdgeInsets.all(30),
            columnPadding: const EdgeInsets.all(30),
            layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            children: [
              ResponsiveRowColumnItem(
                  rowFlex: 1, child: CourseTile(course: courses[0])),
              ResponsiveRowColumnItem(
                  rowFlex: 1, child: CourseTile(course: courses[1])),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(child: SubscribeBlock()),
        ],
      ),
    );
  }
}
