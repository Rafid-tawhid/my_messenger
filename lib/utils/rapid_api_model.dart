class Software {
  final String name;
  final String version;
  final int apiVersion;
  final bool premium;
  final String premiumHint;
  final String status;

  Software({
    required this.name,
    required this.version,
    required this.apiVersion,
    required this.premium,
    required this.premiumHint,
    required this.status,
  });

  factory Software.fromJson(Map<String, dynamic> json) {
    return Software(
      name: json['name'] as String,
      version: json['version'] as String,
      apiVersion: json['apiVersion'] as int,
      premium: json['premium'] as bool,
      premiumHint: json['premiumHint'] as String,
      status: json['status'] as String,
    );
  }
}

class Warnings {
  final bool incompleteResults;

  Warnings({required this.incompleteResults});

  factory Warnings.fromJson(Map<String, dynamic> json) {
    return Warnings(
      incompleteResults: json['incompleteResults'] as bool,
    );
  }
}

class DetectedLanguage {
  final String name;
  final String code;

  DetectedLanguage({required this.name, required this.code});

  factory DetectedLanguage.fromJson(Map<String, dynamic> json) {
    return DetectedLanguage(
      name: json['name'] as String,
      code: json['code'] as String,
    );
  }
}

class Language {
  final String name;
  final String code;
  final DetectedLanguage detectedLanguage;

  Language({required this.name, required this.code, required this.detectedLanguage});

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      name: json['name'] as String,
      code: json['code'] as String,
      detectedLanguage: DetectedLanguage.fromJson(json['detectedLanguage']),
    );
  }
}

class Replacement {
  final String value;

  Replacement({required this.value});

  factory Replacement.fromJson(Map<String, dynamic> json) {
    return Replacement(
      value: json['value'] as String,
    );
  }
}

class Rule {
  final String id;
  final String description;
  final String issueType;
  final Map<String, dynamic> category;

  Rule({
    required this.id,
    required this.description,
    required this.issueType,
    required this.category,
  });

  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      id: json['id'] as String,
      description: json['description'] as String,
      issueType: json['issueType'] as String,
      category: json['category'] as Map<String, dynamic>,
    );
  }
}

class Context {
  final String text;
  final int offset;
  final int length;

  Context({required this.text, required this.offset, required this.length});

  factory Context.fromJson(Map<String, dynamic> json) {
    return Context(
      text: json['text'] as String,
      offset: json['offset'] as int,
      length: json['length'] as int,
    );
  }
}

class Type {
  final String typeName;

  Type({required this.typeName});

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      typeName: json['typeName'] as String,
    );
  }
}

class GrammarCheckMatch {
  final String message;
  final String shortMessage;
  final List<Replacement> replacements;
  final int offset;
  final int length;
  final Context context;
  final String sentence;
  final Type type;
  final Rule rule;

  GrammarCheckMatch({
    required this.message,
    required this.shortMessage,
    required this.replacements,
    required this.offset,
    required this.length,
    required this.context,
    required this.sentence,
    required this.type,
    required this.rule,
  });

  factory GrammarCheckMatch.fromJson(Map<String, dynamic> json) {
    return GrammarCheckMatch(
      message: json['message'] as String,
      shortMessage: json['shortMessage'] as String,
      replacements: (json['replacements'] as List).map((replacementJson) => Replacement.fromJson(replacementJson)).toList(),
      offset: json['offset'] as int,
      length: json['length'] as int,
      context: Context.fromJson(json['context']),
      sentence: json['sentence'] as String,
      type: Type.fromJson(json['type']),
      rule: Rule.fromJson(json['rule']),
    );
  }
}

class GrammarCheckResult {
  final Software software;
  final Warnings warnings;
  final Language language;
  final List<GrammarCheckMatch> matches;

  GrammarCheckResult({
    required this.software,
    required this.warnings,
    required this.language,
    required this.matches,
  });

  factory GrammarCheckResult.fromJson(Map<String, dynamic> json) {
    return GrammarCheckResult(
      software: Software.fromJson(json['software']),
      warnings: Warnings.fromJson(json['warnings']),
      language: Language.fromJson(json['language']),
      matches: (json['matches'] as List).map((matchJson) => GrammarCheckMatch.fromJson(matchJson)).toList(),
    );
  }
}
