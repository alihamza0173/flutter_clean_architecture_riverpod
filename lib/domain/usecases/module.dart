import 'package:clean_architecture_riverpod/data/repository/module.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'delete_todo.dart';
import 'delete_todo_impl.dart';
import 'get_todo.dart';
import 'get_todo_impl.dart';
import 'get_todos.dart';
import 'get_todos_impl.dart';
import 'save_todo.dart';
import 'save_todo_impl.dart';

final getTodosProvider = Provider<GetTodosUseCase>((ref) => GetTodosUseCaseImpl(ref.read(todosProvider)));

final getTodoProvider = Provider<GetTodoUseCase>((ref) => GetTodoUseCaseImpl(ref.read(todosProvider)));

final saveTodoProvider = Provider<SaveTodoUseCase>((ref) => SaveTodoUseCaseImpl(ref.read(todosProvider)));

final deleteTodoProvider = Provider<DeleteTodoUseCase>((ref) => DeleteTodoUseCaseImpl(ref.read(todosProvider)));
