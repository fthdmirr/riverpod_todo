import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:riverpod_todo/view/todo/model/todo_model.dart';

final todoProvider =
    ChangeNotifierProvider<TodoProvider>((ref) => TodoProvider());

class TodoProvider extends ChangeNotifier {
  List<Todo> todoList = [];

  void addTodo(Todo todo) {
    todoList.add(todo);
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    todoList.removeAt(todo.id);
    notifyListeners();
  }
}
