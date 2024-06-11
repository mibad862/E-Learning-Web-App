import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:udemy_clone/widgets/common_bottom_nav_bar.dart';
import 'package:udemy_clone/widgets/web_app_bar.dart';

import '../widgets/custom_button.dart';
import '../widgets/mobile_app_bar.dart';
import 'break-points.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  ScreenTwoState createState() => ScreenTwoState();
}

class ScreenTwoState extends State<ScreenTwo> {
  bool isHovered1 = false;
  bool isHovered2 = false;
  String currentOption = "";
  final TextEditingController _textFieldController = TextEditingController();
  bool isTextFieldEmpty = true;

  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(_checkTextField);
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void _checkTextField() {
    setState(() {
      isTextFieldEmpty = _textFieldController.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        bottomNavigationBar: CommonBottomNavBar(
          leftButton: CustomButton(
            borderRadius: 0,
            width: 90,
            height: 40,
            borderColor: Colors.white,
            buttonColor: Colors.black,
            textColor: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
            text: "Previous",
          ),
          rightButton: CustomButton(
            borderRadius: 0,
            width: 90,
            height: 40,
            borderColor: isTextFieldEmpty ? Colors.grey : Colors.white,
            buttonColor: isTextFieldEmpty ? Colors.grey : Colors.white,
            textColor: isTextFieldEmpty ? Colors.black38 : Colors.black,
            onPressed: isTextFieldEmpty
                ? () {}
                : () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScreenTwo()));
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
                  stepNumberText: "2",
                  showExitButton: true,
                ),
              ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "How about a working title?",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "It's ok if you can't think of a good title now. You can change it later.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: 600,
                height: 80,
                child: TextField(
                  controller: _textFieldController,
                  maxLength: 60,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w300),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                    hintText: "e.g. Learn Photoshop CS6 from Scratch",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
