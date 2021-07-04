// import 'package:auto_route/auto_route.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:robin/application/config/storage_constants.dart';
// import 'package:robin/providers.dart';
// import 'package:robin/application/navigation/app_router.gr.dart';

// class AuthGuard extends AutoRouteGuard {
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     bool dm = useProvider(storageUtilsProvider)
//         .getBoolValue(StorageValues.DARK_THEME_ENABLED);
//     dm ? resolver.next(true) : router.push(const HomeRoute());
//   }
// }
