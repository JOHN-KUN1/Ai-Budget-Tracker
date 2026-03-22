import 'package:budget_tracker/view_models/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/api_service.dart';

part 'api_service_provider.g.dart';

@riverpod
ApiService apiService(Ref ref) {
  return ApiService(dio: ref.watch(dioProvider));
}