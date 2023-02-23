import 'package:flutter/material.dart';
import 'package:state_1/services/todo_model.dart';
import 'package:provider/provider.dart';
import 'favourites_button.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoModel>(
      builder: (context, todos, child) {
        return ListView.builder(
          itemCount: todos.todoLength,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todos.todosList[index].title),
              trailing: FavouritesButton(
                index: index,
              ),
            );
          },
        );
      },
    );
  }
}
