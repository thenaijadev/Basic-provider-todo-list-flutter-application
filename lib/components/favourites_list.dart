import 'package:flutter/material.dart';
import 'package:state_1/services/todo_model.dart';
import 'package:provider/provider.dart';
import 'delete_button.dart';

class FavouritesList extends StatefulWidget {
  const FavouritesList({super.key});

  @override
  State<FavouritesList> createState() => _FavouritesListState();
}

class _FavouritesListState extends State<FavouritesList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoModel>(
      builder: (context, todos, child) {
        return ListView.builder(
          itemCount: todos.favouritesLength,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todos.favouritesList[index].title),
              trailing: DeleteButton(
                index: index,
              ),
            );
          },
        );
      },
    );
  }
}
