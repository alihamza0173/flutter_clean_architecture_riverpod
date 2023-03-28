import 'package:clean_architecture_riverpod/data/repository/todos_impl.dart';
import 'package:clean_architecture_riverpod/domain/repository/todos.dart';
import 'package:clean_architecture_riverpod/data/source/module.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todosProvider = Provider<TodosRepository>(
  (ref) => TodosRepositoryImpl(files: ref.read(filesProvider)),
);
