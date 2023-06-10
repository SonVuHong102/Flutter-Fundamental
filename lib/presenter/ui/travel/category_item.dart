import 'package:flutter/material.dart';
import 'package:flutter_fundamental/gen/fonts.gen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.backgroundColor, required this.iconData, required this.text, required this.onTap});
  final Color backgroundColor;
  final IconData iconData;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFFF8F8F8),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
          child: Row(
            children: [
              Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: backgroundColor,
                ),
                child: Icon(
                  iconData,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                text,
                style: const TextStyle(
                  fontFamily: FontFamily.rubik,
                  fontSize: 15,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
