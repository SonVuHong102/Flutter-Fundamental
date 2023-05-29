import 'package:flutter/material.dart';

class OnlineCircle extends StatelessWidget {
  const OnlineCircle({Key? key, required this.isStory, this.image, this.name}) : super(key: key);
  final bool isStory;
  final Image? image;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          isStory
              ? SizedBox(
                  height: 52,
                  width: 52,
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.04),
                    child: const Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                )
              : Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    SizedBox(
                      width: 52,
                      height: 52,
                      child: image!,
                    ),
                    Container(
                      height: 18,
                      width: 18,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(3),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                      ),
                    )
                  ],
                ),
          const SizedBox(height: 7),
          Text(
            isStory ? 'Your Story' : name ?? '',
            style: TextStyle(
              fontSize: 13,
              color: Colors.black.withOpacity(0.35),
            ),
          )
        ],
      ),
    );
  }
}
