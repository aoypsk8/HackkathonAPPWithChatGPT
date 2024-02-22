import 'package:flutter/material.dart';
import 'package:flutter_toturial/controllers/user_controller.dart';
import 'package:flutter_toturial/pages/widgets/btn.dart';
import 'package:get/get.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UserController _userController = Get.find();
  void doLogout() {
    _userController.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FooterLayout(
        footer: Btn(
          text: "ອອກຈາກລະບົບ",
          func: () => doLogout(),
        ),
      ),
    );
  }
}
