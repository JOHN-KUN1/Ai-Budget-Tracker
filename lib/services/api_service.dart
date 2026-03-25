import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  const ApiService({required this.dio});

  Future<String> getInsights(String transactionDetails) async {
    try {
      final response = await dio.post(
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-3-flash-preview:generateContent",
        data: {
          "contents": [
            {
              "parts": [
                {
                  "text": "Give me your expert analysis on this financial summary: $transactionDetails",
                },
              ],
            },
          ],
          "systemInstruction": {
            "parts": [
              {
                "text":
                    "You are an expert at analyzing financial documents. Analyze the document provided and provide your expert analysis",
              },
            ],
          },
        },
      );
      final data = response.data;
      final aiResponse = data['candidates'][0]['content']['parts'][0]['text'];
      return aiResponse;
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }


}
