import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_fundamental/gen/fonts.gen.dart';

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
      onTap: widget.onTab,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(28)),
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
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(width: 5, color: Colors.white)),
                  child: _isFavorite
                      ? const Icon(Icons.favorite, color: Color(0xFFEB5757))
                      : const Icon(Icons.favorite_outline, color: Colors.black),
                ),
              ),
            ),
            Positioned(
              bottom: 28,
              left: 24,
              right: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Monument to Salavat Yulaev ',
                    style: TextStyle(
                      fontFamily: FontFamily.rubik,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(7, 5, 10, 5),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            color: Colors.white.withOpacity(0.1)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xFFFFD875),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '4.9',
                              style: TextStyle(
                                fontFamily: FontFamily.rubik,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.white.withOpacity(0.65),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
