// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../../application/navigation/app_router.gr.dart';
import '../../../repositories/auth_repository.dart';
import '../../widgets/home_screen_pages/posts_screen/posts_screen_post.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('homepage_title')),
        actions: [
          ElevatedButton(
              onPressed: () => context.read(authRepositoryProvider).signOut(),
              child: const Text('Sign Out')),
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => {},
            heroTag: 'filterButton',
            child: const Icon(Icons.sort),
          ),
          const SizedBox(
            width: 8,
          ),
          FloatingActionButton(
            onPressed: () => context.pushRoute(const NewPostRoute()),
            heroTag: 'newPostButton',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
