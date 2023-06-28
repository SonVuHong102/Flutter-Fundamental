import 'package:flutter/material.dart';
import 'package:flutter_fundamental/data/enum/priority.dart';
import 'package:flutter_fundamental/data/model/todo_entity.dart';

class DetailController extends ChangeNotifier {
  Priority? priority;
  String? title;
  String? description;

  void setData(ToDoEntity? toDoEntity) {
    priority = toDoEntity?.priority ?? Priority.high;
    title = toDoEntity?.title ?? '';
    description = toDoEntity?.description ?? '';
  }

  void onChangePriority(Priority priority) {
    this.priority = priority;
    notifyListeners();
  }

  void onChangeTitle(String title) {
    this.title = title;
    notifyListeners();
  }

  void onChangeDescription(String description) {
    this.description = description;
    notifyListeners();
  }
}
