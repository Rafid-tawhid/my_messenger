class GrammarBotResponse {
  final Map<String, dynamic> software;
  final Map<String, dynamic> warnings;
  final Map<String, dynamic> language;
  final List<Map<String, dynamic>> matches;

  GrammarBotResponse({
    required this.software,
    required this.warnings,
    required this.language,
    required this.matches,
  });

  factory GrammarBotResponse.fromJson(Map<String, dynamic> json) {
    return GrammarBotResponse(
      software: json['software'],
      warnings: json['warnings'],
      language: json['language'],
      matches: List<Map<String, dynamic>>.from(json['matches']),
    );
  }
}