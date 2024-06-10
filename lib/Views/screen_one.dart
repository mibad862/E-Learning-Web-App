import 'package:flutter/material.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  ScreenOneState createState() => ScreenOneState();
}

class ScreenOneState extends State<ScreenOne> {
  bool isHovered1 = false;
  bool isHovered2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        clipBehavior: Clip.none,
        backgroundColor: Colors.black,
        toolbarHeight: 72.0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('MaclayAcademy', style: TextStyle(color: Colors.white)),
            const SizedBox(
              width: 32.0,
            ),
            VerticalDivider(
              color: Colors.white,
              width: 2,
            ),
            Text(
              "Step 1 of 6",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Spacer(),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Exit",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "First, let's find out what type of course you're making.",
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildContainer(
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
                ),
                SizedBox(width: 20),
                _buildContainer(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(
      String textOne,
      String textTwo,
      IconData iconData,
      bool isHovered,
      VoidCallback onEnter,
      VoidCallback onExit,
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
            color: Colors.grey.shade400,
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
