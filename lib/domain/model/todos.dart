import 'package:clean_architecture_riverpod/domain/model/todo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todos.g.dart';

@JsonSerializable()
class Todos {
  List<Todo> values;

  Todos({
    this.values = const [],
  });

  List<Todo> get completed {
    return values.where((todo) => todo.completed).toList();
  }

  List<Todo> get active {
    return values.where((todo) => !todo.completed).toList();
  }

  factory Todos.fromJson(Map<String, dynamic> json) => _$TodosFromJson(json);

  Map<String, dynamic> toJson() => _$TodosToJson(this);
}
