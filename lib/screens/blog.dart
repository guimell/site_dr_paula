import 'package:flutter/material.dart';

import '../config.dart';
import '../widgets.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final searchController = TextEditingController();
  List<BlogPost> postItems = [];

  Future<void> getBlogPosts() async {
    if (Blog.posts.isEmpty) {
      await Blog.getBlog();
    }
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
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SiteConfig.screenHeight = MediaQuery.of(context).size.height;
    SiteConfig.screenWidth = MediaQuery.of(context).size.width;
    SiteConfig.smallScreen = SiteConfig.screenWidth < SiteConfig.screenHeight;
    postItems = [];
    for (Post post in Blog.posts) {
      if (post.contains(searchController.text) || searchController.text == "") {
        postItems.add(BlogPost(post: post));
      }
    }
    return Scaffold(
      appBar: SiteConfig.getAppBar(context, "Blog"),
      floatingActionButton: SiteConfig.getFAB(),
      body: Column(
        children: [
          Container(
            height: 70,
            width: SiteConfig.smallScreen
                ? SiteConfig.screenWidth * 0.70
                : SiteConfig.screenWidth * 0.60,
            margin: const EdgeInsets.all(10),
            child: MyTextField(
              labelText: 'Search topics and key words',
              myController: searchController,
              onChanged: (_) {
                setState(() {});
              },
            ),
          ),
          SizedBox(
            height: SiteConfig.screenHeight - 80 - 10 - 10 - 10 - 10 - 50,
            width: SiteConfig.screenWidth,
            child: ListView(
              scrollDirection:
                  SiteConfig.smallScreen ? Axis.vertical : Axis.horizontal,
              children: postItems,
            ),
          ),
        ],
      ),
    );
  }
}
