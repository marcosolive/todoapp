import 'package:flutter/material.dart';
import 'package:todoapp/models/Todo.dart';
import 'package:todoapp/screens/todo_item.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> list = [];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Todo todo = Todo();
    todo.titulo ='Teste titulo';
    todo.descricao = 'Teste descricao';
    setState(() {
      list.add(todo);
    });
    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Todo App'),
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${list[index].titulo}'),
              subtitle: Text('${list[index].descricao}'),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => TodoItem())),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => TodoItem())),
      ),
    );
  }
}
