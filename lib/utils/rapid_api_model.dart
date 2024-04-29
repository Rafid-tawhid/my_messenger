class GrammarBotResponse {
  List<GrammarBotMatch> matches;
  Software software;
  Warnings warnings;
  Language language;

  GrammarBotResponse({
    required this.matches,
    required this.software,
    required this.warnings,
    required this.language,
  });

  factory GrammarBotResponse.fromJson(Map<String, dynamic> json) {
    return GrammarBotResponse(
      matches: List<GrammarBotMatch>.from(
          json['matches'].map((x) => GrammarBotMatch.fromJson(x))),
      software: Software.fromJson(json['software']),
      warnings: Warnings.fromJson(json['warnings']),
      language: Language.fromJson(json['language']),
    );
  }
}

class Software {
  String name;
  String version;
  int apiVersion;
  bool premium;
  String premiumHint;
  String status;

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
      name: json['name'],
      version: json['version'],
      apiVersion: json['apiVersion'],
      premium: json['premium'],
      premiumHint: json['premiumHint'],
      status: json['status'],
    );
  }
}

class Warnings {
  bool incompleteResults;

  Warnings({
    required this.incompleteResults,
  });

  factory Warnings.fromJson(Map<String, dynamic> json) {
    return Warnings(
      incompleteResults: json['incompleteResults'],
    );
  }
}

class Language {
  String name;
  String code;
  DetectedLanguage detectedLanguage;

  Language({
    required this.name,
    required this.code,
    required this.detectedLanguage,
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      name: json['name'],
      code: json['code'],
      detectedLanguage: DetectedLanguage.fromJson(json['detectedLanguage']),
    );
  }
}

class DetectedLanguage {
  String name;
  String code;

  DetectedLanguage({
    required this.name,
    required this.code,
  });

  factory DetectedLanguage.fromJson(Map<String, dynamic> json) {
    return DetectedLanguage(
      name: json['name'],
      code: json['code'],
    );
  }
}

class GrammarBotMatch {
  String message;
  String shortMessage;
  List<GrammarBotReplacement> replacements;
  int offset;
  int length;
  Context context;
  String sentence;
  Type type;
  Rule rule;

  GrammarBotMatch({
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

  factory GrammarBotMatch.fromJson(Map<String, dynamic> json) {
    return GrammarBotMatch(
      message: json['message'],
      shortMessage: json['shortMessage'],
      replacements: List<GrammarBotReplacement>.from(
          json['replacements'].map((x) => GrammarBotReplacement.fromJson(x))),
      offset: json['offset'],
      length: json['length'],
      context: Context.fromJson(json['context']),
      sentence: json['sentence'],
      type: Type.fromJson(json['type']),
      rule: Rule.fromJson(json['rule']),
    );
  }
}

class GrammarBotReplacement {
  String value;

  GrammarBotReplacement({
    required this.value,
  });

  factory GrammarBotReplacement.fromJson(Map<String, dynamic> json) {
    return GrammarBotReplacement(
      value: json['value'],
    );
  }
}

class Context {
  String text;
  int offset;
  int length;

  Context({
    required this.text,
    required this.offset,
    required this.length,
  });

  factory Context.fromJson(Map<String, dynamic> json) {
    return Context(
      text: json['text'],
      offset: json['offset'],
      length: json['length'],
    );
  }
}

class Type {
  String typeName;

  Type({
    required this.typeName,
  });

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      typeName: json['typeName'],
    );
  }
}

class Rule {
  String id;
  String subId;
  String description;
  String issueType;
  Category category;

  Rule({
    required this.id,
    required this.subId,
    required this.description,
    required this.issueType,
    required this.category,
  });

  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      id: json['id'],
      subId: json['subId'],
      description: json['description'],
      issueType: json['issueType'],
      category: Category.fromJson(json['category']),
    );
  }
}

class Category {
  String id;
  String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
    );
  }
}
