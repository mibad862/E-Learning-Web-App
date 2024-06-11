import 'package:flutter/material.dart';

class CommonBottomNavBar extends StatelessWidget {
  final Widget? leftButton;
  final Widget? rightButton;

  const CommonBottomNavBar({
    super.key,
    this.leftButton,
    this.rightButton,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      clipBehavior: Clip.none,
      height: 70,
      padding: const EdgeInsets.only(bottom: 5, top: 5, right: 20, left: 20),
      elevation: 3.0,
      color: Colors.black,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          leftButton ?? const SizedBox(),
          const Spacer(),
          rightButton ?? const SizedBox(),
        ],
      ),
    );
  }
}
