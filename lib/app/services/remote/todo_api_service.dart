import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import 'package:todo/app/consts/app_apis.dart';
import 'package:todo/app/data/models/todo/todo.dart';
import 'package:todo/app/data/models/todo/todo_request.dart';
import 'package:todo/app/services/remote/token_interceptor.dart';

class TodoApiService {
  static final client = InterceptedClient.build(
    interceptors: [
      TokenInterceptor(),
    ],
    retryPolicy: RefreshTokenretryPolicy(),
  );

  Future getAllTodos() async {
    try {
      http.Response response = await client.get(
        Uri.parse(AppApis.getAllTodos),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future createTodo(TodoRequest todoRequest) async {
    try {
      http.Response response = await client.post(
        Uri.parse(AppApis.createTodo),
        body: TodoRequest.todoRequestToJson(todoRequest),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future deleteTodo(int todoId) async {
    try {
      http.Response response = await client.delete(
        Uri.parse("${AppApis.deleteTodo}/$todoId"),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future updateTodo(Todo todo) async {
    try {
      http.Response response = await client.put(
        Uri.parse("${AppApis.updateTodo}/${todo.id}"),
        body: Todo.singleTodoToJson(todo),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
