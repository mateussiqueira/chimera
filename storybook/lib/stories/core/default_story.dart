import 'package:flutter/material.dart';

abstract class DefaultStory {
  String get name;
  String? get description;
  Widget buildStory(BuildContext context);
}
