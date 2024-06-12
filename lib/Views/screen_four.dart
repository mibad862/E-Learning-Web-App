import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_clone/widgets/common_bottom_nav_bar.dart';
import 'package:udemy_clone/widgets/custom_button.dart';
import 'package:udemy_clone/widgets/mobile_app_bar.dart';
import 'package:udemy_clone/widgets/web_app_bar.dart';

import 'break-points.dart';

class ScreenFour extends StatefulWidget {
  const ScreenFour({super.key});

  @override
  ScreenFourState createState() => ScreenFourState();
}

class ScreenFourState extends State<ScreenFour> {
  int? _selectedOption; // Changed to nullable int

  @override
  Widget build(BuildContext context) {
    bool isContinueEnabled =
        _selectedOption != null; // Check if an option is selected

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
            fontWeight: FontWeight.w600,
            borderRadius: 0,
            width: 115,
            height: 40,
            borderColor: isContinueEnabled ? Colors.white : Colors.grey,
            // Adjust button color based on selection
            buttonColor: isContinueEnabled ? Colors.white : Colors.grey,
            textColor: isContinueEnabled ? Colors.black : Colors.black38,
            onPressed: isContinueEnabled
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScreenFour()),
                    );
                  }
                : () {},
            // Set onPressed to null if continue is not enabled
            text: "Create Course",
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
                  stepNumberText: "4",
                  showExitButton: true,
                ),
              ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "How much time can you spend creating your course per week?",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "There's no wrong answer. We can help you achieve your goals even if you don't have much time.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 60),
              Column(
                children: List<Widget>.generate(4, (int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      height: 55,
                      width: 550,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: RadioListTile<int>(
                        activeColor: Colors.white,
                        title: Text(
                          [
                            'I’m very busy right now (0-2 hours)',
                            'I’ll work on this on the side (2-4 hours)',
                            'I have lots of flexibility (5+ hours)',
                            'I haven’t yet decided if I have time'
                          ][index],
                          style: TextStyle(color: Colors.white),
                        ),
                        value: index,
                        groupValue: _selectedOption,
                        onChanged: (int? value) {
                          setState(() {
                            _selectedOption = value!;
                          });
                        },
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
