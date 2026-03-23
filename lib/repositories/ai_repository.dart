import 'package:budget_tracker/services/api_service.dart';

class AiRepository {
  final ApiService apiService;
  const AiRepository(
    {
      required this.apiService
    }
  );

  Future<String> getInsight(String transactionDetails) async {
    try {
      final insight = await apiService.getInsights(transactionDetails);
      return insight;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}