import 'package:google_generative_ai/google_generative_ai.dart';

final model = GenerativeModel(
    model: 'gemini-pro', apiKey: "AIzaSyASVD7pa0CclJfrujb0gGC5v_gxHFH3m7Q");

Future<GenerateContentResponse> getRecommendation(String prompt) async {
  final content = [Content.text(prompt)];
  final response = await model.generateContent(content);
  return response;
}
