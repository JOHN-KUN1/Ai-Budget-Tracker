import 'package:budget_tracker/services/api_service.dart';

class AiRepository {
  final ApiService apiService;
  const AiRepository(
    {
      required this.apiService
    }
  );

  Future<String> getInsight() async {
    try {
      final insight = apiService.getInsights();
      return '';
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}