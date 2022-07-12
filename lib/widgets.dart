import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'courser_data.dart';

import 'config.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.school_rounded),
        Text(' Dr.Paula'),
      ],
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
            fontSize: ResponsiveValue(
              context,
              defaultValue: 60.0,
              valueWhen: const [
                Condition.smallerThan(
                  name: MOBILE,
                  value: 40.0,
                ),
                Condition.largerThan(
                  name: TABLET,
                  value: 80.0,
                )
              ],
            ).value,
            // color: MediaQuery.platformBrightnessOf(context) == Brightness.light
            //     ? Colors.black
            //     : Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class CourseTile extends StatelessWidget {
  final Course course;
  const CourseTile({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Card(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        // color: Colors.blueGrey[50],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(
                course.image,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                course.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                course.time,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 152, 154, 155),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                course.description,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
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
  const MyTextField({Key? key, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            labelText: labelText),
      ),
    );
  }
}

class AboutBlock extends StatelessWidget {
  final Image? image;
  final String text;

  final Color color;
  const AboutBlock(
      {Key? key, this.image, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> rowColChildren = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ];
    return SizedBox(
      height: 400,
      width: SiteConfig.screenWidth,
      child: Container(
        color: color,
        padding: const EdgeInsets.all(8.0),
        child: SiteConfig.screenWidth > SiteConfig.screenHeight
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: rowColChildren,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: rowColChildren,
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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.grey.withAlpha(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              post.image ?? const SizedBox(),
              Text(post.published),
              // Text(post.authorName),
              Text(post.content),
              // Text(post.id),
              ElevatedButton(
                onPressed: () {
                  // go to url
                  print(post.url);
                },
                child: Text("Read More!"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
