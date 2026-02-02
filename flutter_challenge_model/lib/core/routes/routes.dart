import 'package:flutter/material.dart';
import 'package:flutter_challenge_model/features/user_story/presentation/screens/index.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static const initialRoute = StoryPage.routeName;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case StoryPage.routeName:
        return getRoute(const StoryPage(), settings);
      case CommentPage.routeName:
        return getRoute(const CommentPage(), settings);
      default:
        return getRoute(const StoryPage(), settings);
    }
  }

  static PageRouteBuilder getRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 400),
    );
  }
}
