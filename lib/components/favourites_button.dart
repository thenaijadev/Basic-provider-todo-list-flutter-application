import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:state_1/services/todo_model.dart";

class FavouritesButton extends StatefulWidget {
  const FavouritesButton({super.key, this.index = 0});
  final int index;
  @override
  State<FavouritesButton> createState() => _FavouritesButtonState();
}

class _FavouritesButtonState extends State<FavouritesButton> {
  bool? isDone = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoModel>(builder: (context, todos, child) {
      return IconButton(
        onPressed: () {
          if (todos.todosList[widget.index].isFavourite == false) {
            todos.addToFavourites(widget.index);
          } else {
            todos.removeFromFavourites(widget.index);
          }
        },
        icon: todos.todosList[widget.index].isFavourite
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border),
      );
    });
  }
}

// Switch(
//         value: isDone,
//         activeColor: const Color.fromARGB(255, 54, 244, 57),
//         onChanged: (bool value) {
//           setState(() {
//             isDone = value;
//           });
//           todos.addToDone(widget.index);
//           todos.markAsDone(widget.index);
//         },
//       );