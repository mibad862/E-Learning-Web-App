import 'package:flutter/material.dart';

class CommonDropdownButton extends StatefulWidget {
  final String hintText;
  final List<String> items;
  final double? dropDownHeight;
  final double? dropDownWidth;
  final String? value; // New property for controlling the selected value
  final ValueChanged<String?>? onChanged; // Callback for when the value changes

  const CommonDropdownButton({
    super.key,
    required this.hintText,
    required this.items,
    this.dropDownHeight,
    this.dropDownWidth,
    this.value, // Initialize with a selected value if any
    this.onChanged, // Callback function for value change
  });

  @override
  CommonDropdownButtonState createState() => CommonDropdownButtonState();
}

class CommonDropdownButtonState extends State<CommonDropdownButton> {
  late String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value; // Initialize the selected value
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.center,
      height: widget.dropDownHeight ?? 48,
      width: widget.dropDownWidth ?? 0,
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
          return widget.items.map((String value) {
            return PopupMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                  // Customize the style here
                  fontSize: 16,
                  color: Colors.black,
                  // Add more styling as needed
                ),
              ),
            );
          }).toList();
        },
        onSelected: (String value) {
          setState(() {
            selectedValue = value;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(value); // Call the onChanged callback
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedValue ?? widget.hintText,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(width: 5),
            const Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
