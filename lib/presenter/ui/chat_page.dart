import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_fundamental/presenter/ui/badge_icon.dart';
import 'package:fluttering_phrases/fluttering_phrases.dart';

import '../../gen/assets.gen.dart';
import 'conversation_item.dart';
import 'data_utils.dart';
import 'online_circle.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);
  final listBottomNavigatorItems = [Icons.message, Icons.people, Icons.assistant_navigation];
  @override
  Widget build(BuildContext context) {
    final safeAreaPadding = MediaQuery.of(context).padding;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, safeAreaPadding.top, 0, safeAreaPadding.bottom),
        child: Column(
          children: [
            // TOP
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Assets.image.avatar0.image(width: 40, height: 40),
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
                    backgroundColor: Colors.black.withOpacity(0.04),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 12),
                  CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.04),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            // BODY
            Expanded(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                // primary: true,
                child: Column(
                  children: [
                    // SEARCH BAR
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        style: const TextStyle(fontSize: 17),
                        decoration: InputDecoration(
                          fillColor: Colors.black.withOpacity(0.05),
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
                    // LIST USERS
                    SizedBox(
                      height: 90,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 20,
                        itemBuilder: (_, index) {
                          if (index == 0) {
                            return const OnlineCircle(isStory: true);
                          } else {
                            var user = DataUtil.dataList[index % 6];
                            return OnlineCircle(
                              isStory: false,
                              image: user.image,
                              name: user.firstName,
                            );
                          }
                        },
                      ),
                    ),
                    // const SizedBox(height: 16),
                    // LIST CHAT
                    Container(
                      color: Colors.white,
                      child: ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: 20,
                        padding: EdgeInsets.zero,
                        itemBuilder: (_, index) {
                          var user = DataUtil.dataList[index % 6];
                          return ConversationItem(
                            image: user.image,
                            name: '${user.firstName} ${user.lastName}',
                            lastMessage: generate(),
                            lastSend: index % 2 == 0,
                            sendStatus: index % 2 == 0 ? SendStatus.sent : SendStatus.sending,
                            timeSent: 'Tue',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFA6A6AA),
            width: 0.33,
          ),
        ),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: BottomAppBar(
              height: 60,
              color: Colors.white.withOpacity(0.6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  listBottomNavigatorItems.length,
                  (index) => SizedBox(
                    width: 80,
                    height: 52,
                    child: BadgeIcon(
                      icon: Icon(
                        listBottomNavigatorItems[index],
                        size: 30,
                      ),
                      badgeText: '2',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
