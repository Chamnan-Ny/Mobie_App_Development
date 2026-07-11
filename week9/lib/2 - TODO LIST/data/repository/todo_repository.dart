import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../models/todo.dart';
import '../dto/todo_dto.dart';
import 'repository_exception.dart';

class TodoRepository {
  static final global = TodoRepository(); 
  Uri url = Uri.parse(
    "https://myfirebase-582f4-default-rtdb.asia-southeast1.firebasedatabase.app/todos.json",
  ); // unique instance

  final List<Todo> fakeTodos = [
    Todo(id: '1', title: 'Buy groceries', completed: false),
    Todo(id: '2', title: 'Finish Flutter homework', completed: true),
    Todo(id: '3', title: 'Call the dentist', completed: false),
    Todo(id: '4', title: 'Read 20 pages of a book', completed: true),
    Todo(id: '5', title: 'Go for a 30-minute walk', completed: false),
  ];

  Future<List<Todo>> getTodos() async {
    //  TODO
    //  Adapt the code to handle firebase data fetch
    
    Response response = await http.get(url);

     print(response.body);


    if (response.statusCode != 200) {
      throw RepositoryException("An Error Occured");
    }

    Map<String, dynamic> data = jsonDecode(response.body);

    List<Todo> todo = data.entries.map<Todo>((entry) {
      return TodoDto.fromJson(entry.key, entry.value);
    }).toList();




    return todo;

  
  }

  Future<void> updateCompleted(String todoId, bool completed) async {
    //  TODO
    //  Adapt the code to handle firebase data fetch
    //


    Response response =  await http.patch(
      url,
      body: jsonEncode({'completed': completed}),
    );

    if (response.statusCode != 200) {
      throw RepositoryException("Failed to update");
    }

  }
}
