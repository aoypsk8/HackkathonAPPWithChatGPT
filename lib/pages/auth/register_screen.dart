import 'package:flutter/material.dart';
import 'package:flutter_toturial/controllers/user_controller.dart';
import 'package:flutter_toturial/pages/widgets/btn.dart';
import 'package:flutter_toturial/pages/widgets/formField.dart';
import 'package:flutter_toturial/pages/widgets/textFont.dart';
import 'package:flutter_toturial/utils/colors.dart';
import 'package:flutter_toturial/utils/helper/dialog_helper.dart';
import 'package:get/get.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _passwordConfirmController =
        TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final UserController userController = Get.find();

    void doConfirm() {
      if (_formKey.currentState!.validate()) {
        if (_passwordController.text == _passwordConfirmController.text) {
          userController.register(
            _usernameController.text,
            _passwordController.text,
            _emailController.text,
          );
        } else {
          DialogHelper.showErrorDialog(description: "Password does not match");
        }
      }
    }

    return Scaffold(
      body: SafeArea(
        child: FooterLayout(
          footer: Btn(
            text: "ຢືນຢັນ",
            func: () => doConfirm(),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => Get.back(),
                          child: const Icon(
                            Icons.arrow_back_ios,
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.toNamed("/login"),
                          child: const TextFont(
                            text: "Sing-In",
                            fontSize: 17,
                            color: cr_3c9,
                          ),
                        ),
                      ],
                    ),
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
                      suffixonTapFuc: () => null,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    buildFormField(
                      controller: _emailController,
                      hinText: "Gmail",
                      suffixIcon: const Icon(
                        Icons.mail,
                        color: Colors.grey,
                      ),
                      suffixonTapFuc: () => null,
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
                      suffixonTapFuc: () => null,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    buildFormField(
                      controller: _passwordConfirmController,
                      hinText: "ຢືນຢັນລະຫັດຜ່ານ",
                      suffixIcon: const Icon(
                        Icons.password_sharp,
                        color: Colors.grey,
                      ),
                      suffixonTapFuc: () => null,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
