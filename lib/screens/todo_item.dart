import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/models/Todo.dart';

class TodoItem extends StatefulWidget {
  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();

  _saveItem() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Todo> list = []; 
    var data = prefs.getString('list');
    if(data != null){
      var objs = jsonDecode(data) as List;
      list = objs.map((obj) => Todo.fromJson(obj)).toList();
    }
    
    Todo todo = new Todo.fromTitutloDescricao(_tituloController.text, _descricaoController.text);
    list.add(todo);
    prefs.setString('list', jsonEncode(list));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Todo Item'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _tituloController,
              decoration: InputDecoration(
                  hintText: 'Titulo', border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _descricaoController,
              decoration: InputDecoration(
                  hintText: 'Descrição', border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonTheme(
              minWidth: double.infinity,
              child: RaisedButton(
              color: Colors.orange,
              child: Text('Salvar', style: TextStyle(
                fontSize: 16.0
              ),),
              onPressed: () {},
            )
            ),
          )
          
        ],
      ),
    );
  }
}
