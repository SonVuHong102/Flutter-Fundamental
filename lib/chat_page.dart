import 'package:flutter/material.dart';

import 'data_utils.dart';
import 'gen/assets.gen.dart';
import 'online_circle.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Assets.image.avatar1.image(width: 40, height: 40),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Chats',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black.withAlpha(40),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 12),
                  CircleAvatar(
                    backgroundColor: Colors.black.withAlpha(40),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                style: const TextStyle(fontSize: 17),
                decoration: InputDecoration(
                  fillColor: Colors.black.withAlpha(5),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.search_rounded, size: 24),
                  hintText: 'Search',
                ),
              ),
            ),
            const SizedBox(height: 16),
            Flexible(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: DataUtil.dataList.length + 1,
                itemBuilder: (_, index) {
                  if (index == 0) {
                    return const OnlineCircle(isStory: true);
                  } else {
                    var user = DataUtil.dataList[index - 1];
                    return OnlineCircle(
                      isStory: false,
                      image: user.image,
                      name: user.firstName,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
