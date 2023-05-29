import 'package:flutter/material.dart';
import 'package:flutter_fundamental/gen/assets.gen.dart';

class DataUtil {
  static var dataList = [
    User(Assets.image.avatar1.image(), 'Martin', 'Randolph'),
    User(Assets.image.avatar2.image(), 'Andrew', 'Parker'),
    User(Assets.image.avatar3.image(), 'Karen', 'Castillo'),
    User(Assets.image.avatar4.image(), 'Maisy', 'Humphrey'),
    User(Assets.image.avatar5.image(), 'Joshua', 'Lawrence'),
    User(Assets.image.avatar6.image(), 'Tabitha', 'Potter'),
  ];
}

class User {
  Image image;
  String firstName;
  String lastName;

  User(this.image, this.firstName, this.lastName);
}
