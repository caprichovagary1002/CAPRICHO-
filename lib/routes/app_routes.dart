import 'package:flutter/material.dart';
import '../screens/auth/sign_in_screen.dart';
import '../screens/auth/sign_up_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/bookings/bookings_screen.dart';
import '../screens/products/products_screen.dart';
import '../screens/messages/messages_screen.dart';
import '../screens/profile/profile_screen.dart';

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
      home: (context) => const HomeScreen(),
      bookings: (context) => const BookingsScreen(),
      products: (context) => const ProductsScreen(),
      messages: (context) => const MessagesScreen(),
      profile: (context) => const ProfileScreen(),
      signIn: (context) => const SignInScreen(),
      signUp: (context) => const SignUpScreen(),
    };
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case bookings:
        return MaterialPageRoute(builder: (context) => const BookingsScreen());
      case products:
        return MaterialPageRoute(builder: (context) => const ProductsScreen());
      case messages:
        return MaterialPageRoute(builder: (context) => const MessagesScreen());
      case profile:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case signIn:
        return MaterialPageRoute(builder: (context) => const SignInScreen());
      case signUp:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('Page Not Found'),
            ),
            body: const Center(
              child: Text('404 - Page not found'),
            ),
          ),
        );
    }
  }
}
