import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:todo/app/data/models/todo/todo.dart';
import 'package:todo/app/services/remote/todo_api_service.dart';
import '../../../utils/helpers.dart';

class HomeController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final addTodoFormKey = GlobalKey<FormState>();

  var todos = <Todo>[].obs;

  getAllTodos() async {
    try {
      http.Response response = await TodoApiService().getAllTodos();
      var decodedResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        todos.value = Todo.todoFromJson(jsonEncode(decodedResponse["content"]));
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        Helper.showToastMessage(message: decodedResponse["message"]);
      } else {
        throw Exception();
      }
    } catch (e) {
      log(e.toString());
      Helper.showToastMessage(message: "Something went wrong.");
    }
  }
}
