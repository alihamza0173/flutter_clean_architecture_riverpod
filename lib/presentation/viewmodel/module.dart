import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/model/todo.dart';
import '../../domain/model/todos.dart';
import '../../domain/usecases/module.dart';

// final todosListNotifier = ChangeNotifierProvider<ValueNotifier<Todos>>(
//   (ref) => ValueNotifier(const Todos(values: [])),
// );

class TodosStateNotifier extends StateNotifier<Todos> {
  final Ref ref;
  late final getTodos = ref.read(getTodosProvider);

  TodosStateNotifier(super.state, this.ref) {
    loadTodos();
  }

  Future<void> loadTodos() async {
    state = await getTodos.execute();
  }

  Future<void> save(Todo todo) async {
    await ref.read(saveTodoProvider).execute(todo);
    await loadTodos();
  }

  Future<Todo?> get(String id) async {
    return await ref.read(getTodoProvider).execute(id);
  }

  Future<void> delete(String id) async {
    await ref.read(deleteTodoProvider).execute(id);
    await loadTodos();
  }
}

final todosListState = StateNotifierProvider<TodosStateNotifier, Todos>(
    (ref) => TodosStateNotifier(Todos(values: []), ref));

final todosListModel = Provider<TodosStateNotifier>((ref) => ref.watch(todosListState.notifier));
