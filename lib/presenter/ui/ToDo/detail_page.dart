import 'package:auto_route/annotations.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fundamental/data/color.dart';
import 'package:flutter_fundamental/data/model/todo_entity.dart';

import '../../../data/enum/priority.dart';

@RoutePage()
class DetailPage extends StatelessWidget {
  DetailPage({Key? key, required this.appBarTitle}) : super(key: key);
  final String appBarTitle;
  ToDoEntity? toDoEntity;

  final listPriorityDropdownItems =
      Priority.values.map((e) => DropdownMenuItem<Priority>(value: e, child: Text(e.value)));

  Priority? _dropdownValue;
  String? _title;
  String? _description;

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: Text(appBarTitle),
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
              DropdownButtonFormField2<Priority>(
                value: toDoEntity?.priority ?? Priority.high,
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
                  _dropdownValue = value;
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
              ),
              const SizedBox(height: 24),
              TextFormField(
                onChanged: (value) {
                  _title = value;
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
              ),
              const SizedBox(height: 24),
              TextFormField(
                onChanged: (value) {
                  _description = value;
                },
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: const TextStyle(
                    color: Color(0xFF49454F),
                    backgroundColor: Color(0xFFFEF7FF),
                    fontSize: 12,
                  ),
                  hintText: 'Input title',
                  hintStyle: TextStyle(color: Colors.black),
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
          onPressed: () {},
          child: const Center(
            child: Text('Add'),
          ),
        ),
      ),
    );
  }
}
