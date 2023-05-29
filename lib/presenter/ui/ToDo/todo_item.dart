import 'package:flutter/material.dart';

import '../../../data/model/todo_entity.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({Key? key, required this.toDoEntity}) : super(key: key);
  final ToDoEntity toDoEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFEF7FF),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            toDoEntity.priority.value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  toDoEntity.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit, size: 18),
              ),
              const SizedBox(width: 0),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete, size: 18),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.only(right: 90),
            child: Text(
              toDoEntity.description,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
