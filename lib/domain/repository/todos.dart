import 'package:clean_architecture_riverpod/domain/model/todo.dart';
import 'package:clean_architecture_riverpod/domain/model/todos.dart';

abstract class TodosRepository {
  Future<Todos> loadTodos();
  Future<void> saveTodo(Todo todo);
  Future<void> deleteTodo(String id);
  Future<Todo?> getTodoById(String id);
  Future<void> deleteAllTodos();
}
