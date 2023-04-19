import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final addTodoFormKey = GlobalKey<FormState>();
}
