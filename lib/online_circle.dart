import 'package:flutter/material.dart';

class OnlineCircle extends StatelessWidget {
  const OnlineCircle({Key? key, required this.isStory, this.image, this.name})
      : super(key: key);
  final bool isStory;
  final Image? image;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isStory
            ? Container(
                alignment: Alignment.center,
                height: 18,
                width: 18,
                color: Colors.black.withAlpha(4),
                child: const Icon(
                  Icons.add,
                  size: 20.5,
                ),
              )
            : Stack(
                alignment: Alignment.bottomRight,
                children: [
                  image!,
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
            color: Colors.black.withAlpha(35),
          ),
        )
      ],
    );
  }
}
