import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fundamental/gen/fonts.gen.dart';
import 'package:flutter_fundamental/gen/route.gr.dart';
import 'package:flutter_fundamental/presenter/ui/travel/app_bottom_navigation.dart';
import 'package:flutter_fundamental/presenter/ui/travel/category_item.dart';
import 'package:flutter_fundamental/presenter/ui/travel/view_item.dart';

@RoutePage()
class TravelMainPage extends StatefulWidget {
  const TravelMainPage({super.key});

  @override
  State<TravelMainPage> createState() => _TravelMainPageState();
}

class _TravelMainPageState extends State<TravelMainPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    const categoryCount = 12;
    const itemCount = 12;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: mediaQuery.padding.top),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              nouns[Random().nextInt(nouns.length)],
                              style: const TextStyle(
                                fontFamily: FontFamily.rubik,
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Transform.flip(
                            flipX: true,
                            child: const Icon(
                              Icons.map_outlined,
                              textDirection: TextDirection.ltr,
                              color: Color(0xFFEB5757),
                            ),
                          )
                        ],
                      ),
                      Text(
                        'Choose another',
                        style: TextStyle(
                          fontFamily: FontFamily.rubik,
                          fontSize: 12,
                          color: const Color(0xFF242424).withOpacity(0.5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFF8F8F8),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none),
                            hintText: 'Enter name or category',
                            hintStyle: const TextStyle(
                              fontSize: 15,
                              fontFamily: FontFamily.rubik,
                            ),
                            suffixIcon: Icon(
                              Icons.search,
                              color: const Color(0xFF242424).withOpacity(0.3),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Category',
                          style: TextStyle(
                            fontFamily: FontFamily.rubik,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 52,
                        child: ListView.separated(
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryCount,
                          itemBuilder: (_, index) {
                            if (index == 0 || index == categoryCount - 1) {
                              return const SizedBox(width: 12);
                            } else {
                              return CategoryItem(
                                onTap: () {},
                                backgroundColor: const Color(0xFFEACB8E),
                                iconData: Icons.star,
                                text: 'Top 30 places',
                              );
                            }
                          },
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 12),
                        ),
                      ),
                      const SizedBox(height: 28),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Popular',
                          style: TextStyle(
                            fontFamily: FontFamily.rubik,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 280,
                        child: ListView.separated(
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: itemCount,
                          itemBuilder: (_, index) {
                            if (index == 0 || index == itemCount - 1) {
                              return const SizedBox(width: 12);
                            }
                            return ViewItem(
                              onTab: () {
                                context.router.push(const TravelDetailRoute());
                              },
                            );
                          },
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: AppBottomNavigation(),
      ),
    );
  }
}
