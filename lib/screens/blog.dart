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
  List<BlogPost> postsOnDisplay = [];

  // Future<void> getBlogPosts() async {
  //   if (Blog.posts.isEmpty) {
  //     await Blog.getBlog();
  //   }
  //   if (mounted) {
  //     setState(() {
  //       postsOnDisplay = [];
  //       for (Post post in Blog.posts) {
  //         postsOnDisplay.add(BlogPost(post: post));
  //       }
  //     });
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getBlogPosts();
  // }

  // @override
  // void dispose() {
  //   searchController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    SiteConfig.screenSize = MediaQuery.of(context).size;
    SiteConfig.smallScreen =
        SiteConfig.screenSize.width < SiteConfig.screenSize.height;

    return Scaffold(
      appBar: SiteConfig.getAppBar(context, "Blog"),
      floatingActionButton: SiteConfig.getFAB(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "EM CONSTRUÇÃO...",
            style: TextStyle(
                color: SiteConfig.lightColors.primary,
                fontSize: SiteConfig.getTitleSize()),
          )
          // Container(
          //   height: 70,
          //   width: SiteConfig.smallScreen
          //       ? SiteConfig.screenSize.width * 0.70
          //       : SiteConfig.screenSize.width * 0.60,
          //   margin: const EdgeInsets.all(10),
          //   child: MyTextField(
          //     labelText: 'Search topics and key words',
          //     myController: searchController,
          //     onChanged: (text) {
          //       // no searched text
          //       if (text == "") {
          //         setState(() {
          //           postsOnDisplay = [];
          //           for (Post post in Blog.posts) {
          //             postsOnDisplay.add(BlogPost(post: post));
          //           }
          //         });
          //       }
          //       // match searched text
          //       else {
          //         List<BlogPost> matchedPosts = [];
          //         for (Post post in Blog.posts) {
          //           // match content
          //           if (post.content
          //               .toLowerCase()
          //               .contains(searchController.text.toLowerCase())) {
          //             matchedPosts.add(BlogPost(post: post));
          //           }
          //           // match title
          //           else if (post.title
          //               .toLowerCase()
          //               .contains(searchController.text.toLowerCase())) {
          //             matchedPosts.add(BlogPost(post: post));
          //           }
          //         }
          //         setState(() {
          //           postsOnDisplay = matchedPosts;
          //         });
          //       }
          //     },
          //   ),
          // ),
          // SizedBox(
          //   height: SiteConfig.screenSize.height - 80 - 10 - 10 - 10 - 10 - 50,
          //   width: SiteConfig.screenSize.width,
          //   child: GridView.count(
          //     crossAxisCount: SiteConfig.smallScreen ? 1 : 3,
          //     children: postsOnDisplay,
          //   ),
          // ),
        ],
      ),
    );
  }
}
