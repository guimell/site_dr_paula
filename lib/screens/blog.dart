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

  Future<void> getBlogPosts() async {
    if (Blog.posts.isEmpty) {
      await Blog.getBlog();
      if (mounted) {
        setState(() {});
      }
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
    SiteConfig.screenSize = MediaQuery.of(context).size;
    SiteConfig.smallScreen =
        SiteConfig.screenSize.width < SiteConfig.screenSize.height;

    return Scaffold(
      appBar: SiteConfig.getAppBar(context, "Blog"),
      floatingActionButton: SiteConfig.getFAB(),
      body: Column(
        children: [
          Container(
            height: 70,
            width: SiteConfig.smallScreen
                ? SiteConfig.screenSize.width * 0.70
                : SiteConfig.screenSize.width * 0.60,
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
            height: SiteConfig.screenSize.height - 80 - 10 - 10 - 10 - 10 - 50,
            width: SiteConfig.screenSize.width,
            child: ListView.builder(
              itemCount: Blog.posts.length,
              scrollDirection:
                  SiteConfig.smallScreen ? Axis.vertical : Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return BlogPost(post: Blog.posts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
