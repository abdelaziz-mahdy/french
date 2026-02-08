class VocabularyWord {
  final String french;
  final String english;
  final String partOfSpeech; // 'noun', 'verb', 'adjective', 'adverb', 'preposition', 'conjunction', 'pronoun', 'expression'
  final String? gender; // 'm', 'f', or null (for non-nouns)
  final String exampleFr;
  final String exampleEn;
  final String level; // 'A1', 'A2', 'B1', 'B2'
  final String category; // 'greetings', 'food', 'travel', 'work', 'family', 'home', 'health', 'shopping', 'time', 'weather', 'emotions', 'education', 'nature', 'city', 'clothing', 'body', 'colors', 'numbers_misc', 'daily_routine', 'hobbies'
  final String phonetic;

  const VocabularyWord({
    required this.french,
    required this.english,
    required this.partOfSpeech,
    this.gender,
    required this.exampleFr,
    required this.exampleEn,
    required this.level,
    required this.category,
    required this.phonetic,
  });

  factory VocabularyWord.fromJson(Map<String, dynamic> json) => VocabularyWord(
        french: json['french'] as String,
        english: json['english'] as String,
        partOfSpeech: json['partOfSpeech'] as String,
        gender: json['gender'] as String?,
        exampleFr: json['exampleFr'] as String,
        exampleEn: json['exampleEn'] as String,
        level: json['level'] as String,
        category: json['category'] as String,
        phonetic: json['phonetic'] as String,
      );

  Map<String, dynamic> toJson() => {
        'french': french,
        'english': english,
        'partOfSpeech': partOfSpeech,
        if (gender != null) 'gender': gender,
        'exampleFr': exampleFr,
        'exampleEn': exampleEn,
        'level': level,
        'category': category,
        'phonetic': phonetic,
      };
}
