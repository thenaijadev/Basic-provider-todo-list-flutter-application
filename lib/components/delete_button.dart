import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_1/services/todo_model.dart';

class DeleteButton extends StatefulWidget {
  const DeleteButton({super.key, this.index});
  final int? index;
  @override
  State<DeleteButton> createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<DeleteButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoModel>(builder: (context, todos, child) {
      return IconButton(
        onPressed: () {
          todos.removeFromFavourites(widget.index);
        },
        icon: const Icon(Icons.delete),
      );
    });
  }
}
