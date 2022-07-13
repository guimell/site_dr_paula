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

class ContentBlock extends StatelessWidget {
  final bool rowCol;
  final Image? image;
  final Color? color;
  final String? title;
  final String text;

  const ContentBlock({
    Key? key,
    this.rowCol = true,
    this.image,
    this.color,
    this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    if (title != null) {
      children.add(
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Text(
              title!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    }
    if (image != null) {
      children.add(
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(child: image),
        ),
      );
    }
    children.add(
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Text(
            text,
          ),
        ),
      ),
    );

    double width = SiteConfig.screenWidth;
    if (rowCol) {
      width = SiteConfig.screenHeight > SiteConfig.screenWidth
          ? SiteConfig.screenWidth
          : SiteConfig.screenWidth / 2;
    }

    return AnimatedSize(
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
      child: Container(
        // color: Colors.black.withAlpha(200),
        width: width,
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
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
              post.image == ""
                  ? const SizedBox()
                  : FadeInImage.assetNetwork(
                      placeholder: "assets/images/Ripple.gif",
                      image: post.image,
                    ),
              Text(post.published),
              // Text(post.authorName),
              Text(post.content),
              // Text(post.id),
              ElevatedButton(
                onPressed: () {
                  // go to url
                  print(post.url);
                },
                child: const Text("Read More!"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
