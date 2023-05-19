import 'package:flutter/material.dart';
import 'package:flutter_fundamental/gen/assets.gen.dart';

class DataUtil {
  static var dataList = [
    User(Assets.image.avatar1.image(), 'First Name 1', 'Last Name 1'),
    User(Assets.image.avatar2.image(), 'First Name 2', 'Last Name 2'),
    User(Assets.image.avatar3.image(), 'First Name 3', 'Last Name 3'),
    User(Assets.image.avatar4.image(), 'First Name 4', 'Last Name 4'),
    User(Assets.image.avatar5.image(), 'First Name 5', 'Last Name 5'),
    User(Assets.image.avatar6.image(), 'First Name 6', 'Last Name 6'),
  ];
}

class User {
  Image image;
  String firstName;
  String lastName;

  User(this.image, this.firstName, this.lastName);
}
