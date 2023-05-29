import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fundamental/data/color.dart';
import 'package:flutter_fundamental/gen/route.gr.dart';
import 'package:flutter_fundamental/presenter/ui/ToDo/todo_item.dart';

import '../../../data/enum/priority.dart';
import '../../../data/model/todo_entity.dart';

List<ToDoEntity> listToDoEntity = List.generate(
  3,
  (index) => ToDoEntity(
    id: index,
    priority: Priority.medium,
    title: 'List item',
    description:
        'Supporting line text lorem ipsum dolor sit amet, consectetur.',
  ),
);

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo List App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: ColorsUtil.primaryColor,
      ),
      body: ListView.separated(
        physics: const ClampingScrollPhysics(),
        itemCount: listToDoEntity.length,
        itemBuilder: (_, index) => TodoItem(
          toDoEntity: listToDoEntity[index],
        ),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 10);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.router.push(DetailRoute(isAdd: true));
          setState(() {});
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
