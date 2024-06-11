import 'package:flutter/material.dart';
import 'package:udemy_clone/widgets/common_bottom_nav_bar.dart';

import '../widgets/custom_button.dart';
import '../widgets/mobile_app_bar.dart';
import '../widgets/web_app_bar.dart';
import 'break-points.dart';
import 'screen_two.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  ScreenOneState createState() => ScreenOneState();
}

class ScreenOneState extends State<ScreenOne> {
  bool isHovered1 = false;
  bool isHovered2 = false;
  String currentOption = "";

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        bottomNavigationBar: CommonBottomNavBar(
          leftButton: CustomButton(
            borderRadius: 0,
            width: 90,
            height: 40,
            borderColor: currentOption.isEmpty ? Colors.grey : Colors.white,
            buttonColor: currentOption.isEmpty ? Colors.grey : Colors.white,
            textColor: currentOption.isEmpty ? Colors.black38 : Colors.black,
            onPressed: currentOption.isEmpty
                ? () {}
                : () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ScreenTwo()));
                  },
            text: "Continue",
          ),
        ),
        backgroundColor: Colors.black,
        appBar: constraints.maxWidth < mobileBreakPoint
            ? const PreferredSize(
                preferredSize: Size(double.infinity, 55.0),
                child: MobileAppBar(),
              )
            : PreferredSize(
                preferredSize: Size(double.infinity, 72.0),
                child: WebAppBar(
                  stepNumberText: "1",
                  showExitButton: true,
                ),
              ),

        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "First, let's find out what type of course you're making.",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentOption = "Course";
                      });
                    },
                    child: _buildContainer(
                      "Course",
                      "Circle rich learning\nexperiences with the help of\nvideo lectures, quizzes, coding\nexercises, etc.",
                      Icons.play_circle_outline,
                      isHovered1,
                      () {
                        setState(() {
                          isHovered1 = true;
                        });
                      },
                      () {
                        setState(() {
                          isHovered1 = false;
                        });
                      },
                      currentOption == "Course"
                          ? Colors.amber
                          : Colors.grey.shade400,
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentOption = "Test";
                      });
                    },
                    child: _buildContainer(
                      "Practise Test",
                      "Help students prepare for\ncertifications exams by\nproviding practise questions.",
                      Icons.menu,
                      isHovered2,
                      () {
                        setState(() {
                          isHovered2 = true;
                        });
                      },
                      () {
                        setState(() {
                          isHovered2 = false;
                        });
                      },
                      currentOption == "Test"
                          ? Colors.amber
                          : Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildContainer(
    String textOne,
    String textTwo,
    IconData iconData,
    bool isHovered,
    VoidCallback onEnter,
    VoidCallback onExit,
    Color borderColor,
  ) {
    return MouseRegion(
      onEnter: (_) => onEnter(),
      onExit: (_) => onExit(),
      child: Container(
        padding: EdgeInsets.only(top: 30),
        alignment: Alignment.topCenter,
        width: 240,
        height: 275,
        decoration: BoxDecoration(
          color: isHovered ? Colors.grey.shade800 : Colors.transparent,
          border: Border.all(
            color: borderColor,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              textOne,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8),
            Text(
              textTwo,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
