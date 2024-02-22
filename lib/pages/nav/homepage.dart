import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_toturial/controllers/home_controller.dart';
import 'package:flutter_toturial/controllers/user_controller.dart';
import 'package:flutter_toturial/pages/widgets/textFont.dart';
import 'package:flutter_toturial/utils/colors.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              header_home(),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _homeController.unitsData.length,
                  itemBuilder: (context, unitIndex) {
                    // Use a different variable name here
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              // Toggle the visibility of the tapped unit
                              _homeController.showTextColumn[unitIndex] =
                                  !_homeController.showTextColumn[unitIndex];
                              // If the tapped unit is now visible, hide all other units
                              if (_homeController.showTextColumn[unitIndex]) {
                                for (int i = 0;
                                    i < _homeController.showTextColumn.length;
                                    i++) {
                                  if (i != unitIndex) {
                                    _homeController.showTextColumn[i] = false;
                                  }
                                }
                              }
                            });
                          },
                          child: SizedBox(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Icon(
                                  _homeController.showTextColumn[unitIndex]
                                      ? Icons.arrow_drop_down_outlined
                                      : Icons.arrow_right_outlined,
                                  size: 50,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFont(
                                      text: _homeController.unitsData[unitIndex]
                                          ["unit_name"],
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const TextFont(
                                      text:
                                          "Describing routines & adverb of Frequency ",
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (_homeController.showTextColumn[unitIndex]) ...[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              _homeController
                                  .unitsData[unitIndex]["lessons"].length,
                              (lessonIndex) => card_box(
                                func: () => Get.toNamed(
                                  "/conversation",
                                  arguments: _homeController
                                          .unitsData[unitIndex]['lessons']
                                      [lessonIndex]["lesson_content"],
                                ),
                                lessonData: _homeController.unitsData[unitIndex]
                                    ['lessons'][lessonIndex],
                              ),
                            ),
                          ),
                        ],
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class card_box extends StatelessWidget {
  const card_box({
    super.key,
    required this.func,
    required this.lessonData,
  });
  final VoidCallback func;
  final Map<String, dynamic> lessonData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.white.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFont(
                          text: lessonData["lesson_name"],
                          color: Colors.black54,
                          fontSize: 13.5,
                        ),
                        TextFont(
                          text: lessonData["lesson_content"],
                          fontSize: 13.5,
                          color: Colors.black87,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(thickness: sqrt2),
        ],
      ),
    );
  }
}

class header_home extends StatelessWidget {
  const header_home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final UserController _userController = Get.find();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFont(
                        text: "AOY",
                        color: cr_3c9,
                        fontSize: 15,
                        maxLines: 5,
                      ),
                      TextFont(
                        text: "20 78 844 081",
                        color: cr_3c9,
                        fontSize: 13,
                      ),
                    ],
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 45,
                    child: Image.network(
                      "https://w7.pngwing.com/pngs/69/495/png-transparent-red-and-yellow-fire-animated-illustration-fire-flame-flames-background-s-orange-fictional-character-combustion-thumbnail.png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const TextFont(
                    text: "4",
                    fontSize: 25,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
