// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import 'package:robin/ui/screens/home_screen.dart';
import 'package:robin/ui/screens/home_screen_pages/messages_screen.dart';
import 'package:robin/ui/screens/home_screen_pages/posts_screen.dart';
import 'package:robin/ui/screens/home_screen_pages/profile_screen.dart';
import 'package:robin/ui/screens/settings_screen.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: HomeScreen,
      children: [
        AutoRoute(
          path: 'posts',
          name: 'PostsRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: PostsScreen),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        AutoRoute(
          path: 'messages',
          name: 'MessagesRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: MessagesScreen),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        AutoRoute(
          path: 'profile',
          name: 'ProfileRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: ProfileScreen),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
      ],
    ),
    AutoRoute(
      path: '/settings',
      page: SettingsScreen,
    ),
  ],
)
class $AppRouter {}
