import 'package:flutter_toturial/pages/auth/login_screen.dart';
import 'package:flutter_toturial/pages/auth/register_screen.dart';
import 'package:flutter_toturial/pages/conversation/conversation.dart';
import 'package:flutter_toturial/pages/first_page/dashboard_screen.dart';
import 'package:flutter_toturial/pages/nav/navigator_bottom.dart';
import 'package:get/route_manager.dart';

class AppRoute {
  static List<GetPage> routes = [
    GetPage(
      name: '/',
      page: () => const Dashboard(),
    ),
    GetPage(
      name: '/login',
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: '/register',
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: '/nav',
      page: () => const NavigatorBottom(),
    ),
    GetPage(
      name: '/conversation',
      page: () => const ConversationPage(),
    ),
  ];
}
