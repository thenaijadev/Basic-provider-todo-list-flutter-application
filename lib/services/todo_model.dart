import 'package:flutter/material.dart';
import 'todo.dart';
import 'dart:collection';

class TodoModel extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(
      title: "Make Bed",
      isFavourite: false,
    ),
    Todo(
      title: "Read Books",
      isFavourite: false,
    )
  ];

  final List<Todo> _favourites = [];

  int get todoLength => _todos.length;
  int get favouritesLength => _favourites.length;

  UnmodifiableListView<Todo> get todosList => UnmodifiableListView(_todos);

  UnmodifiableListView<Todo> get favouritesList =>
      UnmodifiableListView(_favourites);

  void addToFavourites(index) async {
    _todos[index].isFavourite = true;
    if (!_favourites.contains(_todos[index])) {
      _favourites.add(_todos[index]);
    }

    notifyListeners();
  }

  void removeFromFavourites(index) async {
    _todos[index].isFavourite = false;
    _favourites.remove(_favourites[index]);

    notifyListeners();
  }

  void addTodo(String title) {
    _todos.add(Todo(title: title, isFavourite: false));
    notifyListeners();
  }
  // void markAsDone(index) {
  //   _todos[index].isDone = true;
  // }

  // void clearIsDone() {
  //   _deletedTodos.clear();
  //   notifyListeners();
  // }

  // void removeFromIsDone(Todo todo) {
  //   _deletedTodos.remove(todo);
  // }

  // void addTodo(Todo todo) {
  //   _todos.add(todo);
  //   notifyListeners();
  // }

  // void deleteTodo(Todo todo) {
  //   _todos.remove(todo);
  //   notifyListeners();
  // }

  // void deleteAllTodos(Todo todo) {
  //   _todos.clear();
  //   notifyListeners();
  // }
}
