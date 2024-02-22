import 'package:flutter/material.dart';
import 'package:flutter_toturial/pages/widgets/btn.dart';
import 'package:flutter_toturial/pages/widgets/textFont.dart';
import 'package:flutter_toturial/utils/colors.dart';
import 'package:flutter_toturial/utils/icon_image.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final FlutterTts _flutterTts = FlutterTts();
  speak(String text) async {
    print(text);
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(0.8);
    await _flutterTts.speak(text);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    logo_widget(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 100),
                      child: Column(
                        children: [
                          TextFont(
                            text: "WELCOME",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 5,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFont(
                            text:
                                "It is a long established fact that a reader  ",
                            fontSize: 15,
                            color: cr_696,
                          ),
                          TextFont(
                            text:
                                "Lorem content of a page when looking at its layout",
                            fontSize: 15,
                            color: cr_696,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Btn(
                    text: "Login",
                    func: () => Get.toNamed("/login"),
                    color: cr_ffe,
                  ),
                  Btn(
                    text: "Register",
                    func: () => Get.toNamed("/register"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class logo_widget extends StatelessWidget {
  const logo_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Lottie.network(
            "https://lottie.host/b1622498-8f28-4b26-b068-d2232efde365/XLT54YW1YV.json",
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
            frameRate: FrameRate(90),
          ),
        ),
      ],
    );
  }
}
