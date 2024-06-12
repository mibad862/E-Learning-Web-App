import 'package:flutter/material.dart';
import 'package:udemy_clone/Views/home_view.dart';
import 'package:udemy_clone/widgets/custom_button.dart';

class WebAppBar extends StatefulWidget {
  final bool automaticallyImplyLeading;
  final Clip clipBehavior;
  final Color backgroundColor;
  final double toolbarHeight;
  final Widget? stack1;
  final Widget? stack2;
  final String? stepNumberText;
  final bool? showExitButton;

  const WebAppBar({
    super.key,
    this.automaticallyImplyLeading = false,
    this.clipBehavior = Clip.none,
    this.backgroundColor = Colors.black,
    this.toolbarHeight = 72.0,
    this.stack1,
    this.stack2,
    this.stepNumberText,
    this.showExitButton,
  });

  @override
  State<WebAppBar> createState() => _WebAppBarState();
}

class _WebAppBarState extends State<WebAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      clipBehavior: widget.clipBehavior,
      backgroundColor: widget.backgroundColor,
      toolbarHeight: widget.toolbarHeight,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/home_screen_img1.png",
            width: 70,
            height: 70,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 4),
          const Text('Maclay\nAcademy',
              style: TextStyle(
                letterSpacing: 1.5,
                color: Colors.white,
                fontSize: 16,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w700,
              )),
          const SizedBox(width: 50.0),
          if (widget.stepNumberText != null) ...[
            Text('Step ${widget.stepNumberText} of 4',
                style: const TextStyle(
                  letterSpacing: 1.0,
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w200,
                )),
          ],
          const Spacer(),
          if(widget.showExitButton != null)
          TextButton(
            style: TextButton.styleFrom(
              textStyle: TextStyle(fontSize: 18),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomeView()));
            },
            child: Text("Exit"),
          ),
          if (widget.stack1 != null) ...[
            widget.stack1!,
          ],
          if (widget.stack2 != null) ...[
            widget.stack2!,
          ],
        ],
      ),
    );
  }
}
