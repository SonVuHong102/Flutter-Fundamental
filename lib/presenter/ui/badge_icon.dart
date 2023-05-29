import 'package:flutter/material.dart';

class BadgeIcon extends StatelessWidget {
  const BadgeIcon({Key? key, required this.icon, required this.badgeText}) : super(key: key);
  final Icon icon;
  final String badgeText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        icon,
        Positioned(
          top: 5,
          right: 15,
          child: Container(
            alignment: Alignment.center,
            height: 22,
            width: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(220, 240, 215, 1.0),
              border: Border.all(width: 3, color: Color.fromRGBO(228, 228, 228, 1)),
            ),
            child: Text(
              '2',
              style: TextStyle(fontSize: 13, color: Color.fromRGBO(90, 212, 57, 1)),
            ),
          ),
        )
      ],
    );
  }
}
