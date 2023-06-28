import 'package:flutter_fundamental/data/enum/priority.dart';
import 'package:flutter_fundamental/data/model/todo_entity.dart';

class LocalDataSource {
  static final toDoListEntity = List.generate(
    3,
    (index) => ToDoEntity(
      id: index,
      priority: Priority.medium,
      title: 'List item',
      description:
          'Supporting line text lorem ipsum dolor sit amet, consectetur.',
    ),
  );
}
