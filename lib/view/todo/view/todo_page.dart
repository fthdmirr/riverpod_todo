import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:riverpod_todo/view/todo/model/todo_model.dart';
import 'package:riverpod_todo/view/todo/view_model/todo_provider.dart';

class TodoPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final todoWatcher = watch(todoProvider);
    final todoList = todoWatcher.todoList;
    return Scaffold(
      appBar: buildAppBar,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context
            .read(todoProvider)
            .addTodo(Todo(title: 'başlık', completed: false)),
      ),
      body: buildListView(todoList),
    );
  }

  AppBar get buildAppBar => AppBar(
        title: Text('Todo'),
      );

  ListView buildListView(List<Todo> todoList) {
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(todoList[index].title),
          leading: todoList[index].completed == false
              ? Icon(Icons.check_box_outline_blank)
              : Icon(Icons.check_box),
        ),
      ),
    );
  }
}
