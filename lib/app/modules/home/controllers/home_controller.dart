import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:todo/app/data/models/todo/todo.dart';
import 'package:todo/app/data/models/todo/todo_request.dart';
import 'package:todo/app/services/remote/todo_api_service.dart';
import '../../../utils/helpers.dart';

class HomeController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  final editTitleController = TextEditingController();
  final editDescriptionController = TextEditingController();

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

    return todos;
  }

  createTodo() async {
    try {
      TodoRequest todoRequest = TodoRequest(
        title: titleController.text,
        description: descriptionController.text,
      );

      http.Response response = await TodoApiService().createTodo(todoRequest);
      var decodedResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Todo todo = Todo.fromJson(decodedResponse);
        todos.add(todo);

        titleController.clear();
        descriptionController.clear();

        todos.refresh();
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

  deleteTodo(int index) async {
    try {
      int id = todos[index].id;

      http.Response response = await TodoApiService().deleteTodo(id);
      var decodedResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        todos.removeAt(index);
        todos.refresh();
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

  markTodoAsCompleted(int index, bool? value) async {
    try {
      Todo todo = todos[index];

      http.Response response = await TodoApiService().updateTodo(
        todo,
      );

      log(response.body);
      var decodedResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        todos[index].completed = value ?? false;
        todos.refresh();
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
