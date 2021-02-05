import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:riverpod_todo/core/extensions/context_extensions.dart';
import 'package:riverpod_todo/view/todo/model/todo_model.dart';
import 'package:riverpod_todo/view/todo/view_model/todo_provider.dart';

class TodoPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    TextEditingController title = TextEditingController();
    final todoWatcher = watch(todoProvider);
    final todoList = todoWatcher.todoList;
    return Scaffold(
      appBar: buildAppBar,
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            context.read(todoProvider).addTodo(Todo(title: title.text ?? "", completed: false)),
      ),
      body: Padding(
        padding: EdgeInsets.all(context.height / 65),
        child: Column(
          children: [
            TextFormField(
              controller: title,
              onSaved: (value) => title.text = value,
            ),
            Expanded(child: buildListView(todoList)),
          ],
        ),
      ),
    );
  }

  AppBar get buildAppBar => AppBar(
        title: Text('Todo'),
      );

  ListView buildListView(List<Todo> todoList) {
    return ListView(
      children: todoList
          .map((todo) => Card(
                child: ListTile(
                    title: Text(todo.title),
                    leading: IconButton(
                      onPressed: () => todo.completed = !todo.completed,
                      icon: todo.completed == false
                          ? Icon(Icons.check_box_outline_blank)
                          : Icon(Icons.check_box),
                    )),
              ))
          .toList(),
    );
  }
}
