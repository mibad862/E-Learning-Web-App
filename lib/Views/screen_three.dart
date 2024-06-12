import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_clone/Views/screen_four.dart';
import 'package:udemy_clone/widgets/common_bottom_nav_bar.dart';
import 'package:udemy_clone/widgets/common_dropdown_button.dart';
import 'package:udemy_clone/widgets/custom_button.dart';
import 'package:udemy_clone/widgets/mobile_app_bar.dart';
import 'package:udemy_clone/widgets/web_app_bar.dart';

import 'break-points.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({super.key});

  @override
  ScreenThreeState createState() => ScreenThreeState();
}

class ScreenThreeState extends State<ScreenThree> {
  String dropdownValue = 'Choose a category';

  @override
  Widget build(BuildContext context) {
    bool isDropDownEmpty = dropdownValue == 'Choose a category';

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
            borderColor: isDropDownEmpty ? Colors.grey : Colors.white,
            buttonColor: isDropDownEmpty ? Colors.grey : Colors.white,
            textColor: isDropDownEmpty ? Colors.black38 : Colors.black,
            onPressed: isDropDownEmpty
                ? () {}
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScreenFour()),
                    );
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
            : const PreferredSize(
                preferredSize: Size(double.infinity, 72.0),
                child: WebAppBar(
                  stepNumberText: "3",
                  showExitButton: true,
                ),
              ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "What category best fits the knowledge you'll share?",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "If you're not sure about the right category, you can change it later.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 60),
              CommonDropdownButton(
                dropDownWidth: 550,
                hintText: 'Choose a category',
                value: dropdownValue,
                onChanged: (newValue) {
                  setState(() {
                    dropdownValue = newValue as String;
                  });
                },
                items: const <String>[
                  'Choose a category',
                  'Development',
                  'Business',
                  'Finance & Accounting',
                  'IT & Software',
                  'Office Productivity',
                  'Personal Development',
                  'Design',
                  'Marketing',
                  'Lifestyle',
                  'Photography & Video',
                  'Health & Fitness',
                  'Music',
                  'Teaching & Academics',
                  "I don't know yet"
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
