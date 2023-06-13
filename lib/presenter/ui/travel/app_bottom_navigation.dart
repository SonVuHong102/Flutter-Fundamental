import 'package:flutter/material.dart';

class AppBottomNavigation extends StatefulWidget {
  AppBottomNavigation({super.key});

  final List<IconData> listItem = [
    Icons.border_all_outlined,
    Icons.favorite_border_outlined,
    Icons.message_outlined,
    Icons.settings_outlined,
  ];

  @override
  State<AppBottomNavigation> createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  var currentSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(57, 30, 30, 57),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          widget.listItem.length,
          (index) => GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentSelectedIndex == index
                    ? const Color(0xFFEB5757)
                    : Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  widget.listItem[index],
                  color: currentSelectedIndex == index
                      ? Colors.white
                      : const Color(0xFF414141),
                ),
              ),
            ),
            onTap: () {
              if (currentSelectedIndex != index) {
                currentSelectedIndex = index;
                setState(() {});
              }
            },
          ),
        ),
      ),
    );
  }
}
