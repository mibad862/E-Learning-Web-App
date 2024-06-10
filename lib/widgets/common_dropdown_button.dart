import 'package:flutter/material.dart';

class CommonDropdownButton extends StatelessWidget {
  final String hintText;
  final List<String> items;

  const CommonDropdownButton({
    super.key,
    required this.hintText,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.center,
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
      child: PopupMenuButton<String>(
        color: Colors.white,
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context) {
          return items.map((String value) {
            return PopupMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  // Customize the style here
                  fontSize: 16,
                  color: Colors.black,
                  // Add more styling as needed
                ),
              ),
            );
          }).toList();
        },
        onSelected: (_) {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              hintText,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontSize: 16, color: Colors.white),
            ),
            SizedBox(width: 5),
            Icon(Icons.keyboard_arrow_down_outlined, size: 20, color: Colors.white,),
          ],
        ),
      ),
    );
  }
}