import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_toturial/controllers/user_controller.dart';
import 'package:flutter_toturial/pages/widgets/btn.dart';
import 'package:flutter_toturial/pages/widgets/formField.dart';
import 'package:flutter_toturial/pages/widgets/textFont.dart';
import 'package:flutter_toturial/utils/colors.dart';
import 'package:get/get.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    void doSubmit() {
      if (_formKey.currentState!.validate()) {
        userController.login(
          _usernameController.text,
          _passwordController.text,
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black38),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: InkWell(
                onTap: () => Get.toNamed("/register"),
                child: const TextFont(
                  text: "Sing-Up",
                  fontSize: 17,
                  color: cr_3c9,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: FooterLayout(
          footer: Btn(
            text: "ຢືນຢັນ",
            color: cr_ffe,
            func: () => doSubmit(),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  buildFormField(
                    controller: _usernameController,
                    hinText: "ຊື່ຜູ້ໃຊ້",
                    suffixIcon: const Icon(
                      Icons.people,
                      color: Colors.grey,
                    ),
                    suffixonTapFuc: () => print("login_screen.dart"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  buildFormField(
                    controller: _passwordController,
                    hinText: "ລະຫັດຜ່ານ",
                    suffixIcon: const Icon(
                      Icons.password_sharp,
                      color: Colors.grey,
                    ),
                    suffixonTapFuc: () => print("login_screen.dart"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const TextFont(
                    text: "Forget passwprd?",
                    fontSize: 15,
                    color: cr_3c9,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: const Divider(thickness: sqrt2, endIndent: 20),
                      ),
                      TextFont(
                        text: "OR",
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: const Divider(thickness: sqrt2, endIndent: 20),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
