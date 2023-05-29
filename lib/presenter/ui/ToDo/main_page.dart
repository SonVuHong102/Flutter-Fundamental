import 'package:flutter/material.dart';
import 'package:flutter_fundamental/data/color.dart';
import 'package:flutter_fundamental/presenter/ui/ToDo/todo_item.dart';

import '../../../data/enum/priority.dart';
import '../../../data/model/todo_entity.dart';

List<ToDoEntity> listToDoEntity = List.generate(
  15,
  (index) => ToDoEntity(
    priority: Priority.high,
    title: 'List item',
    description: 'Supporting line text lorem ipsum dolor sit amet, consectetur.',
  ),
);

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List App'),
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
        onPressed: () {},
      ),
    );
  }
}
