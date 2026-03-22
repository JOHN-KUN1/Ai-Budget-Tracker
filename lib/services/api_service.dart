import 'dart:convert';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  const ApiService({required this.dio});

  Future<String> getInsights() async {
    try {
      final response = await dio.post(
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-3-flash-preview:generateContent",
        data: {
          "contents": [
            {
              "parts": [
                {
                  "text": "what is your specialty",
                },
              ],
            },
          ],
          "systemInstruction": {
            "parts": [
              {"text": "You are an expert at analyzing financial documents."},
            ],
          },
        },
      );
      final data = response.data;
      final aiResponse = data['candidates'][0]['content']['parts'][0]['text'];
      log(aiResponse.toString());
      return '';
    } catch (e) {
      log(dotenv.env['API_KEY'].toString());
      log(e.toString());
      throw Exception(e.toString());
    }
  }
}
