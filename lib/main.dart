import 'package:clean_architecture_riverpod/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: TodosApp()));
}
