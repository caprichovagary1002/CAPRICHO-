import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/';
  static const String bookings = '/bookings';
  static const String products = '/products';
  static const String messages = '/messages';
  static const String profile = '/profile';
  static const String signIn = '/signin';
  static const String signUp = '/signup';

  static Map<String, WidgetBuilder> get routes {
    return {
      home: (context) => const Placeholder(),
      bookings: (context) => const Placeholder(),
      products: (context) => const Placeholder(),
      messages: (context) => const Placeholder(),
      profile: (context) => const Placeholder(),
      signIn: (context) => const Placeholder(),
      signUp: (context) => const Placeholder(),
    };
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const Placeholder(),
      settings: settings,
    );
  }
}
