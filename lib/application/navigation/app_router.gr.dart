// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// Flutter imports:
import 'package:flutter/material.dart' as _i2;

// Package imports:
import 'package:auto_route/auto_route.dart' as _i1;

// Project imports:
import 'package:robin/application/navigation/auth_guard.dart' as _i3;
import 'package:robin/ui/screens/home_screen.dart' as _i5;
import 'package:robin/ui/screens/home_screen_pages/messages_screen.dart' as _i9;
import 'package:robin/ui/screens/home_screen_pages/posts_screen.dart' as _i7;
import 'package:robin/ui/screens/home_screen_pages/profile_screen.dart' as _i10;
import 'package:robin/ui/screens/login_screen.dart' as _i4;
import 'package:robin/ui/screens/settings_screen.dart' as _i6;

import 'package:robin/ui/screens/home_screen_pages/posts_screen_pages/new_post_screen.dart'
    as _i8;

class AppRouter extends _i1.RootStackRouter {
  AppRouter(
      {_i2.GlobalKey<_i2.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i3.AuthGuard authGuard;

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.LoginScreen();
        }),
    HomeRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.HomeScreen();
        }),
    SettingsRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.SettingsScreen();
        }),
    PostsRouter.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    MessagesRouter.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    ProfileRouter.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    PostsRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i7.PostsScreen();
        }),
    NewPostRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i8.NewPostScreen();
        }),
    MessagesRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i9.MessagesScreen();
        }),
    ProfileRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i10.ProfileScreen();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LoginRoute.name, path: '/login'),
        _i1.RouteConfig(HomeRoute.name, path: '/', guards: [
          authGuard
        ], children: [
          _i1.RouteConfig(PostsRouter.name, path: 'posts', children: [
            _i1.RouteConfig(PostsRoute.name, path: ''),
            _i1.RouteConfig(NewPostRoute.name, path: 'new'),
            _i1.RouteConfig('*#redirect',
                path: '*', redirectTo: '', fullMatch: true)
          ]),
          _i1.RouteConfig(MessagesRouter.name, path: 'messages', children: [
            _i1.RouteConfig(MessagesRoute.name, path: ''),
            _i1.RouteConfig('*#redirect',
                path: '*', redirectTo: '', fullMatch: true)
          ]),
          _i1.RouteConfig(ProfileRouter.name, path: 'profile', children: [
            _i1.RouteConfig(ProfileRoute.name, path: ''),
            _i1.RouteConfig('*#redirect',
                path: '*', redirectTo: '', fullMatch: true)
          ])
        ]),
        _i1.RouteConfig(SettingsRoute.name, path: '/settings')
      ];
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute() : super(name, path: '/login');

  static const String name = 'LoginRoute';
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

class SettingsRoute extends _i1.PageRouteInfo {
  const SettingsRoute() : super(name, path: '/settings');

  static const String name = 'SettingsRoute';
}

class PostsRouter extends _i1.PageRouteInfo {
  const PostsRouter({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'posts', initialChildren: children);

  static const String name = 'PostsRouter';
}

class MessagesRouter extends _i1.PageRouteInfo {
  const MessagesRouter({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'messages', initialChildren: children);

  static const String name = 'MessagesRouter';
}

class ProfileRouter extends _i1.PageRouteInfo {
  const ProfileRouter({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRouter';
}

class PostsRoute extends _i1.PageRouteInfo {
  const PostsRoute() : super(name, path: '');

  static const String name = 'PostsRoute';
}

class NewPostRoute extends _i1.PageRouteInfo {
  const NewPostRoute() : super(name, path: 'new');

  static const String name = 'NewPostRoute';
}

class MessagesRoute extends _i1.PageRouteInfo {
  const MessagesRoute() : super(name, path: '');

  static const String name = 'MessagesRoute';
}

class ProfileRoute extends _i1.PageRouteInfo {
  const ProfileRoute() : super(name, path: '');

  static const String name = 'ProfileRoute';
}
