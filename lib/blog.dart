import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'config.dart';
import 'widgets.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  List<BlogPost> postItems = [];

  Future<void> getBlogPosts() async {
    await Blog.getBlog();
    if (mounted) {
      setState(() {
        for (Post post in Blog.posts) {
          postItems.add(BlogPost(post: post));
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getBlogPosts();
  }

  @override
  Widget build(BuildContext context) {
    SiteConfig.screenHeight = MediaQuery.of(context).size.height;
    SiteConfig.screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: SiteConfig.getAppBar(context, "Blog"),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: SiteConfig.screenHeight * 0.2,
                width: SiteConfig.screenWidth / 1,
                color: Colors.grey.withAlpha(20),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Blog",
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
              AnimatedSize(
                duration: const Duration(seconds: 1),
                child: Column(
                  children: postItems,
                ),
              ),
              Container(
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
              ),
              SiteConfig.getFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
