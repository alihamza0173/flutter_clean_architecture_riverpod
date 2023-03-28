import 'package:clean_architecture_riverpod/data/source/file.dart';
import 'package:clean_architecture_riverpod/data/source/files_memory_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final filesProvider = Provider<Files>((ref) => FilesMemoryImpl());
