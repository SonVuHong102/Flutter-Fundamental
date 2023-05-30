import '../enum/priority.dart';
import '../model/todo_entity.dart';

List<ToDoEntity> listToDoEntity = List.generate(
  3,
  (index) => ToDoEntity(
    id: index,
    priority: Priority.medium,
    title: 'List item',
    description: 'Supporting line text lorem ipsum dolor sit amet, consectetur.',
  ),
);
