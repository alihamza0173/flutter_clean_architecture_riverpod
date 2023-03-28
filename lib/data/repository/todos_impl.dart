import 'dart:convert';

import 'package:clean_architecture_riverpod/domain/model/todo.dart';
import 'package:clean_architecture_riverpod/domain/model/todos.dart';
import 'package:clean_architecture_riverpod/domain/repository/todos.dart';
import 'package:clean_architecture_riverpod/data/source/file.dart';
import 'package:collection/collection.dart';

class TodosRepositoryImpl extends TodosRepository {
  TodosRepositoryImpl({required this.files});
  final Files files;
  late final String _path = 'todos.json';

  @override
  Future<Todos> loadTodos() async {
    // Load Todos from path
    final content = await files.read(_path);
    if (content == null) return Todos(values: []);

    // Transform it to json and then to list
    return Todos.fromJson(jsonDecode(content));
  }

  @override
  Future<Todo?> getTodoById(String id) async {
    // Load Todos from path
    final Todos todos = await loadTodos();

    // Find todo by id and return it
    return todos.values.firstWhereOrNull((todo) => todo.id == id);
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    // Load Todos from path
    final Todos todos = await loadTodos();

    // Add new todo to list
    final newTodos = [...todos.values, todo];

    // Save new Todos to path
    await files.write(_path, jsonEncode(Todos(values: newTodos).toJson()));
  }

  @override
  Future<void> deleteAllTodos() async {
    // Delete files by path
    files.delete(_path);
  }

  @override
  Future<void> deleteTodo(String id) async {
    // Load Todos from path
    final Todos todos = await loadTodos();

    // Remove todo from list
    final newTodos = todos.values.where((t) => t.id != id).toList();

    // Save new Todos to path
    await files.write(_path, jsonEncode(Todos(values: newTodos).toJson()));
  }
}
