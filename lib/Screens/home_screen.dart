import 'package:flutter/material.dart';
import 'package:state_1/components/favourites_list.dart';
import 'package:state_1/services/todo_model.dart';
import '../components/todo-list.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static final List<Widget> _widgetOptions = <Widget>[
    const TodoList(),
    const FavouritesList()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var text = "";
    return Scaffold(
      body: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Alert(
                context: context,
                title: "Add Todo",
                content: Column(
                  children: <Widget>[
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          text = value;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                    ),
                  ],
                ),
                buttons: [
                  DialogButton(
                    onPressed: () {
                      Provider.of<TodoModel>(context, listen: false)
                          .addTodo(text);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Add to list",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ]).show();
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('Provider Todo List.'),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Todo List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outlined),
              label: 'Favourites',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
