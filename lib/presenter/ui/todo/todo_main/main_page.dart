import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fundamental/data/color.dart';
import 'package:flutter_fundamental/data/local_data_source/local_data_source.dart';
import 'package:flutter_fundamental/data/model/todo_entity.dart';
import 'package:flutter_fundamental/gen/route.gr.dart';
import 'package:flutter_fundamental/presenter/ui/todo/todo_main/todo_item.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

void sortList(List<ToDoEntity> listToDoEntity) {
  listToDoEntity.sort(
    (a, b) {
      if (a.priority.priority == b.priority.priority) {
        return a.title.compareTo(b.title);
      }
      return a.priority.priority.compareTo(b.priority.priority);
    },
  );
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final listToDoEntity = LocalDataSource.toDoListEntity;
    sortList(LocalDataSource.toDoListEntity);
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
          onModifySuccess: () {
            setState(() {});
          },
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
