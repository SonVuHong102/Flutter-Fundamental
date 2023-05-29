import '../enum/priority.dart';

class ToDoEntity {
  int? id;
  final Priority priority;
  final String title;
  final String description;

  ToDoEntity({
    this.id,
    required this.priority,
    required this.title,
    required this.description,
  });
}
