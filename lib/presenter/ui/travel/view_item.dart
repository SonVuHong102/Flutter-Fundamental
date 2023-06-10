import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

class ViewItem extends StatefulWidget {
  const ViewItem({super.key, required this.onTab});
  final VoidCallback onTab;

  @override
  State<ViewItem> createState() => _ViewItemState();
}

class _ViewItemState extends State<ViewItem> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Assets.image.view1.image(fit: BoxFit.contain),
          Positioned(
            top: 16,
            right: 16,
            child: GestureDetector(
              onTap: () {
                _isFavorite = !_isFavorite;
                setState(() {});
              },
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white, border: Border.all(width: 5, color: Colors.white)),
                child: _isFavorite
                    ? const Icon(Icons.favorite, color: Color(0xFFEB5757))
                    : const Icon(Icons.favorite_outline, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
