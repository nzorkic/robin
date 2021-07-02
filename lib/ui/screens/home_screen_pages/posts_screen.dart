import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:robin/application/navigation/app_router.gr.dart';
import 'package:robin/ui/widgets/home_screen_pages/posts_screen/posts_screen_post.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('homepage_title')),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              child: const Icon(Icons.settings),
              onTap: () => context.pushRoute(const SettingsRoute()),
            ),
          ),
        ],
      ),
      body: ListView(
        children: const [
          PostsScreenPost(),
          PostsScreenPost(),
          PostsScreenPost(),
          PostsScreenPost()
        ],
      ),
    );
  }
}
