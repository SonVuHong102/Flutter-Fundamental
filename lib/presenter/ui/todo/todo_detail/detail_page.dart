import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fundamental/data/color.dart';
import 'package:flutter_fundamental/data/local_data_source/local_data_source.dart';
import 'package:flutter_fundamental/data/model/todo_entity.dart';
import 'package:flutter_fundamental/presenter/ui/todo/todo_detail/detail_controller.dart';
import 'package:provider/provider.dart';

import '../../../../data/enum/priority.dart';

@RoutePage()
class DetailPage extends StatelessWidget {
  DetailPage({Key? key, required this.isAdd, this.toDoEntity})
      : super(key: key);
  final bool isAdd;
  final ToDoEntity? toDoEntity;

  final listPriorityDropdownItems = Priority.values
      .map((e) => DropdownMenuItem<Priority>(value: e, child: Text(e.value)));

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;
    context.read<DetailController>().setData(toDoEntity);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(isAdd ? 'Add Todo' : 'Edit Todo'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        backgroundColor: ColorsUtil.primaryColor,
        shadowColor: Colors.transparent,
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        behavior: HitTestBehavior.translucent,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Selector<DetailController, Priority?>(
                selector: (_, controller) => controller.priority,
                builder: (_, priority, __) {
                  return DropdownButtonFormField2<Priority>(
                    value: priority,
                    decoration: InputDecoration(
                      labelText: 'Priority',
                      labelStyle: const TextStyle(
                        color: Color(0xFF49454F),
                        backgroundColor: Color(0xFFFEF7FF),
                        fontSize: 12,
                      ),
                      hintText: 'Input title',
                      hintStyle: const TextStyle(color: Colors.black),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    isDense: true,
                    items: listPriorityDropdownItems.toList(),
                    onChanged: (value) {
                      context.read<DetailController>().onChangePriority(value!);
                    },
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: mediaQuerySize.width - 32,
                      padding: null,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color(0xFFE6E0E9),
                      ),
                      elevation: 8,
                      offset: const Offset(-10, -20),
                    ),
                    buttonStyleData: const ButtonStyleData(),
                  );
                },
              ),
              const SizedBox(height: 24),
              Selector<DetailController, String?>(
                selector: (_, controller) => controller.title,
                builder: (_, title, __) {
                  return TextFormField(
                    initialValue: title,
                    onChanged: (value) {
                      context.read<DetailController>().onChangeTitle(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: const TextStyle(
                        color: Color(0xFF49454F),
                        backgroundColor: Color(0xFFFEF7FF),
                        fontSize: 12,
                      ),
                      hintText: 'Input title',
                      hintStyle: const TextStyle(color: Colors.black),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    cursorColor: Colors.black,
                  );
                },
              ),
              const SizedBox(height: 24),
              Selector<DetailController, String?>(
                selector: (_, controller) => controller.description,
                builder: (_, description, __) {
                  return TextFormField(
                    initialValue: description,
                    onChanged: (value) {
                      context
                          .read<DetailController>()
                          .onChangeDescription(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: const TextStyle(
                        color: Color(0xFF49454F),
                        backgroundColor: Color(0xFFFEF7FF),
                        fontSize: 12,
                      ),
                      hintText: 'Input description',
                      hintStyle: const TextStyle(color: Colors.black),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    cursorColor: Colors.black,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 40,
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              backgroundColor: ColorsUtil.primaryColor),
          onPressed: () {
            final controller = context.read<DetailController>();
            final listToDoEntity = LocalDataSource.toDoListEntity;
            if (isAdd) {
              if (![
                controller.priority,
                controller.title,
                controller.description
              ].contains(null)) {
                var maxId = listToDoEntity.first.id ?? 1;
                for (var element in listToDoEntity) {
                  maxId = max(maxId, element.id ?? 1);
                }
                final newId = maxId + 1;
                listToDoEntity.add(ToDoEntity(
                    id: newId,
                    priority: controller.priority!,
                    title: controller.title!,
                    description: controller.description!));
              }
            } else {
              listToDoEntity
                  .removeWhere((element) => element.id == toDoEntity?.id);
              listToDoEntity.add(ToDoEntity(
                  id: toDoEntity?.id,
                  priority: controller.priority!,
                  title: controller.title!,
                  description: controller.description!));
            }
            context.router.pop();
          },
          child: Center(
            child: Text(
              isAdd ? 'Add' : 'Edit',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
