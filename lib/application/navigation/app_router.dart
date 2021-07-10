// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import '../../ui/screens/home_screen.dart';
import '../../ui/screens/home_screen_pages/messages_screen.dart';
import '../../ui/screens/home_screen_pages/posts_screen.dart';
import '../../ui/screens/home_screen_pages/posts_screen_pages/new_post_screen.dart';
import '../../ui/screens/home_screen_pages/profile_screen.dart';
import '../../ui/screens/login_screen.dart';
import '../../ui/screens/settings_screen.dart';
import 'auth_guard.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/login',
      page: LoginScreen,
    ),
    AutoRoute(
      path: '/',
      page: HomeScreen,
      guards: [AuthGuard],
      children: [
        AutoRoute(
          path: 'posts',
          name: 'PostsRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: PostsScreen),
            AutoRoute(path: 'new', page: NewPostScreen),
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
