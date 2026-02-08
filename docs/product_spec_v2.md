# Parler - Product Spec v2

**Last updated**: 2026-02-08
**Status**: Active development
**Target audience**: English speakers learning French for TEF Canada (NCLC 5+)

---

## Table of Contents

1. [Vocabulary Learning Approach](#1-vocabulary-learning-approach)
2. [Word Bank Data Structure](#2-word-bank-data-structure)
3. [TEF Test Simulator](#3-tef-test-simulator)
4. [Audio Pronunciation](#4-audio-pronunciation)
5. [Navigation Reorganization](#5-navigation-reorganization)
6. [Dark Mode](#6-dark-mode)

---

## 1. Vocabulary Learning Approach

### 1.1 Learning Philosophy

The vocabulary trainer uses a **flashcard-based spaced repetition** model. The existing SM-2 algorithm (`lib/services/spaced_repetition.dart`) and `CardProgress` model (`lib/models/progress.dart`) are already implemented and tested. The vocabulary trainer wires these into a dedicated learning flow.

### 1.2 Flashcard Flow

Each learning session follows this sequence:

1. **Session setup**: User selects a category (e.g., "Food & Drink") or taps "Review Due" to study cards due for review.
2. **Card presentation**: Show the **French word** prominently, with phonetic transcription below it, a speaker icon for TTS, and the part of speech / gender tag (e.g., "nm" for noun masculine).
3. **Reveal**: User taps the card (or a "Show Answer" button) to flip and reveal the **English translation** and **example sentence** (French + English).
4. **Self-rating**: User rates recall quality using **3 buttons** that map to SM-2 quality scores:
   - "Again" (red) -> quality 1 (incorrect, but remembered on seeing answer)
   - "Good" (gold) -> quality 3 (correct with some difficulty)
   - "Easy" (green) -> quality 5 (perfect recall)
5. **Progress update**: `SpacedRepetition.review()` calculates next review date. `ProgressNotifier.updateCardProgress()` persists the result.
6. **Next card**: Advance to the next card in the session queue.

### 1.3 Session Structure

- **New words per session**: 10 words (configurable, but default to 10 for A1, 12 for A2, 15 for B1/B2)
- **Review cards**: All due cards are shown BEFORE new cards. If there are more than 20 due cards, show 20 due + 5 new. Otherwise show all due + new words up to session size.
- **New word introduction**: When a user sees a word for the first time (no `CardProgress` entry exists), show it as a "learning" card: French word visible, tap to reveal English. After revealing, only offer "Again" and "Good" (no "Easy" for brand-new words). This creates the initial `CardProgress` entry via `CardProgress.initial(wordId)`.
- **Session progress bar**: Show a thin progress bar at top of the flashcard screen indicating position in session (e.g., card 3 of 15). Allow swiping left to go back to the previous card (read-only, no re-rating).
- **Session end**: After all cards are reviewed, show a **mini-quiz** of 5 multiple-choice questions drawn from the words just studied. This reinforces learning and provides an additional quality signal.
- **Results screen**: Show session stats -- words reviewed, new words learned, accuracy %, next review date for earliest card.

### 1.4 Mini-Quiz After Session

The mini-quiz uses the words from the session that was just completed:

- **5 questions**, multiple choice (4 options each)
- Question types (randomly selected per question):
  - "What does [French word] mean?" -> 4 English options
  - "How do you say [English word] in French?" -> 4 French options
  - "Complete: [example sentence with blank]" -> 4 word options
- Distractors are drawn from the same category and level to be plausible
- Getting a question wrong does NOT penalize the SM-2 score (the self-rating already captured that). The mini-quiz is purely reinforcement.
- Score is shown as "4/5 correct" with brief feedback per question

### 1.5 Word Categories and CEFR Levels

Words are tagged with both a **category** (topic) and a **level** (CEFR):

**Categories** (20 topics):
| Category ID | Display Name | Icon | Target Count |
|---|---|---|---|
| `greetings` | Greetings & Politeness | `Icons.waving_hand_rounded` | 20 |
| `family` | Family & Relationships | `Icons.family_restroom_rounded` | 25 |
| `food` | Food & Drink | `Icons.restaurant_rounded` | 50 |
| `home` | Home & Living | `Icons.home_rounded` | 30 |
| `daily_routine` | Daily Life (core verbs/adj) | `Icons.today_rounded` | 30 |
| `work` | Work & Career | `Icons.work_rounded` | 40 |
| `travel` | Travel & Transport | `Icons.flight_rounded` | 30 |
| `shopping` | Shopping & Money | `Icons.shopping_bag_rounded` | 25 |
| `time` | Time & Calendar | `Icons.schedule_rounded` | 25 |
| `education` | Education & Learning | `Icons.school_rounded` | 30 |
| `emotions` | Emotions & Feelings | `Icons.mood_rounded` | 25 |
| `health` | Health & Medicine | `Icons.local_hospital_rounded` | 25 |
| `body` | Body Parts | `Icons.accessibility_new_rounded` | 20 |
| `nature` | Nature & Environment | `Icons.park_rounded` | 20 |
| `weather` | Weather & Seasons | `Icons.wb_sunny_rounded` | 15 |
| `clothing` | Clothing & Appearance | `Icons.checkroom_rounded` | 20 |
| `colors` | Colors | `Icons.palette_rounded` | 15 |
| `city` | City & Places | `Icons.location_city_rounded` | 20 |
| `hobbies` | Hobbies & Leisure | `Icons.sports_soccer_rounded` | 20 |
| `connectors` | Linking Words (B1-B2) | `Icons.link_rounded` | 25 |

**Total target: ~510 words for MVP** (across A1-B2). Expanded from original 640 target to reflect realistic scope with quality content.

**CEFR Levels**:
| Level | Description | Word Count Target |
|---|---|---|
| `A1` | Beginner (survival French) | ~200 words |
| `A2` | Elementary (daily situations) | ~200 words |
| `B1` | Intermediate (TEF NCLC 5 target) | ~200 words |
| `B2` | Upper intermediate (stretch goal) | ~40 words (MVP) |

### 1.6 Progress Tracking Per Word

Each word's progress is stored in `UserProgress.flashcards` using the word ID as key and `CardProgress` as value. The existing model already supports:
- `easeFactor`: SM-2 ease factor (starts at 2.5)
- `interval`: Days until next review
- `repetitions`: Consecutive correct count
- `nextReviewDate`: ISO 8601 date string
- `quality`: Last quality rating

**No model changes needed.** The existing `CardProgress` and `SpacedRepetition` classes handle all vocabulary progress.

### 1.7 Words Tab UI Structure

The Words tab (`/wordbank` route, currently showing patterns/phrases/false friends) will be **replaced** with the vocabulary trainer:

**Top section**: Summary bar showing "X words learned | Y due for review"

**Tab bar** (3 tabs):
1. **Learn** -- Start a new session (pick category or "Smart Mix" which auto-selects from due + weakest categories)
2. **Browse** -- Browse all words by category, filterable by level. Each word shows its mastery status (new / learning / mastered). Tap a word to see full details.
3. **Reference** -- The existing patterns/phrases/false friends content (moved here as a sub-section)

**Learn tab detail**:
- Grid of category cards (2 columns), each showing category name, icon, word count, and progress (e.g., "24/80 mastered")
- "Review Due (N)" button at top if there are due cards -- this takes priority
- "Smart Mix" card at the top of the grid -- starts a session mixing due review cards with new words from the user's weakest category (fewest mastered words relative to total)
- Tapping a category starts a session with words from that category
- Category icons: See the category table in section 1.5 for icon mappings. Use a `Map<String, IconData>` constant for lookup.

**Browse tab detail**:
- List of all words, grouped by category
- Filter chips at top: A1 | A2 | B1 | B2 | All
- Search bar to find specific words
- Each word row shows: French word, English, mastery indicator (color dot: gray=new, gold=learning, green=mastered)
- Tap a word to see full card with phonetic, example, gender, TTS button

**Mastery definitions** (for the color dot indicator):
- **New** (gray): No `CardProgress` entry exists for this word ID
- **Learning** (gold): `CardProgress` exists but `repetitions < 3` or `easeFactor < 2.0`
- **Mastered** (green): `repetitions >= 3` AND `easeFactor >= 2.0`

---

## 2. Word Bank Data Structure

### 2.1 Vocabulary JSON Schema

File: `assets/data/vocabulary.json`

```json
{
  "version": 1,
  "words": [
    {
      "id": "food_001",
      "french": "le pain",
      "english": "bread",
      "phonetic": "luh pah(n)",
      "partOfSpeech": "noun",
      "gender": "m",
      "level": "A1",
      "category": "food",
      "exampleFr": "Je voudrais du pain, s'il vous plait.",
      "exampleEn": "I would like some bread, please."
    }
  ]
}
```

### 2.2 Field Definitions

| Field | Type | Required | Description |
|---|---|---|---|
| `id` | string | yes | Unique ID. Format: `{category}_{3-digit-number}`. Example: `food_001` |
| `french` | string | yes | The French word or short phrase, **including article for nouns** (le/la/l'/les). Example: `"la pomme"` not `"pomme"` |
| `english` | string | yes | English translation. Keep it to the primary meaning. |
| `phonetic` | string | yes | Simplified phonetic guide for English speakers. Use parentheses for nasals: `(n)`, `(m)`. Example: `"lah pohm"` |
| `partOfSpeech` | string | yes | One of: `noun`, `verb`, `adjective`, `adverb`, `preposition`, `conjunction`, `pronoun`, `interjection`, `expression` |
| `gender` | string | conditional | Required when `partOfSpeech` is `noun`. One of: `"m"` (masculine), `"f"` (feminine). Null for non-nouns. UI should map to display labels: `"m"` -> `"nm"`, `"f"` -> `"nf"`. |
| `level` | string | yes | CEFR level: `A1`, `A2`, `B1`, or `B2` |
| `category` | string | yes | One of the 15 category IDs from section 1.5 |
| `exampleFr` | string | yes | A natural French sentence using the word. Keep sentences short (under 12 words). Use vocabulary appropriate to the word's CEFR level. |
| `exampleEn` | string | yes | English translation of the example sentence. |

### 2.3 Data Quality Rules

1. **Articles on nouns**: Always include the definite article (le/la/l') in the `french` field for nouns. This teaches gender alongside vocabulary.
2. **Phonetic consistency**: Use a simplified system, not IPA. Target audience does not know IPA. Stressed syllables in CAPS: `"boh(n)-ZHOOR"`. Nasal vowels in parentheses.
3. **Example sentences**: Must use the target word naturally. Should be at or below the word's CEFR level. No sentences requiring B2 grammar for an A1 word.
4. **No duplicates**: Each word appears once. If a word fits multiple categories (e.g., "rouge" could be colors or clothing), pick the most natural one.
5. **Verb form**: Verbs are listed in infinitive form: `"manger"` not `"je mange"`. The example sentence shows conjugated usage.
6. **Adjective form**: List masculine singular form. Example sentence can show agreement.

### 2.4 Dart Model

File: `lib/models/vocabulary_word.dart`

```dart
class VocabularyWord {
  final String id;
  final String french;
  final String english;
  final String phonetic;
  final String partOfSpeech;
  final String? gender;
  final String level;
  final String category;
  final String exampleFr;
  final String exampleEn;
}
```

Manual `fromJson` / `toJson` -- no code generation. Follow the same pattern as existing models (see `lib/models/phrase.dart`).

### 2.5 Provider

Add to `lib/providers/data_provider.dart`:

```dart
final vocabularyProvider = FutureProvider<List<VocabularyWord>>((ref) async {
  ref.keepAlive();
  return ref.watch(dataRepositoryProvider).getVocabulary();
});

final vocabularyByCategoryProvider =
    Provider.family<List<VocabularyWord>, String>((ref, category) {
  final vocabAsync = ref.watch(vocabularyProvider);
  return vocabAsync.when(
    data: (words) => words.where((w) => w.category == category).toList(),
    loading: () => [],
    error: (_, _) => [],
  );
});

final vocabularyByLevelProvider =
    Provider.family<List<VocabularyWord>, String>((ref, level) {
  final vocabAsync = ref.watch(vocabularyProvider);
  return vocabAsync.when(
    data: (words) => words.where((w) => w.level == level).toList(),
    loading: () => [],
    error: (_, _) => [],
  );
});
```

---

## 3. TEF Test Simulator

### 3.1 What is the TEF?

The TEF (Test d'evaluation de francais) is the official French proficiency test accepted by IRCC for Canadian immigration. It has 4 sections:

| Section | French Name | Format | Duration | Questions |
|---|---|---|---|---|
| Reading | Comprehension ecrite (CE) | Multiple choice on passages | 60 min | 50 |
| Listening | Comprehension orale (CO) | Multiple choice on audio | 40 min | 60 |
| Writing | Expression ecrite (EE) | Written responses | 60 min | 2 tasks |
| Speaking | Expression orale (EO) | Oral interview | 15 min | 2 tasks |

### 3.2 MVP Scope: Reading Comprehension (CE) Only

For MVP, we implement **Comprehension ecrite (CE)** only. This is the easiest to build (no audio/recording needed) and the most directly testable via multiple choice.

### 3.3 TEF CE Test Structure

A complete practice test contains:

- **Section A** (Questions 1-15): Short texts -- signs, notices, ads, short messages. 1 question per text.
- **Section B** (Questions 16-30): Medium texts -- emails, articles, instructions. 2-3 questions per text.
- **Section C** (Questions 31-40): Longer texts -- newspaper articles, opinion pieces. 3-4 questions per text.
- **Section D** (Questions 41-50): Complex texts -- formal documents, argumentative texts. 3-5 questions per text.

Each question has **4 answer choices (A, B, C, D)**, exactly one correct.

### 3.4 Question Types Within CE

1. **Literal comprehension**: "According to the text, what is...?"
2. **Inference**: "What can we conclude from...?"
3. **Vocabulary in context**: "In this text, the word X means..."
4. **Purpose/tone**: "What is the purpose of this text?"
5. **Detail identification**: "Which of the following is mentioned in the text?"

### 3.5 Scoring and NCLC Mapping

TEF CE raw scores map to NCLC levels:

| NCLC Level | TEF CE Score (out of 300) | Immigration Use |
|---|---|---|
| NCLC 4 | 181-216 | Minimum for some programs |
| NCLC 5 | 217-248 | Target for Express Entry (CLB 5) |
| NCLC 6 | 249-279 | Higher points for Express Entry |
| NCLC 7 | 280-297 | Maximum useful for immigration |
| NCLC 8+ | 298-300 | Near-native |

**In-app scoring**: We convert raw score (correct out of 50) to a simulated TEF score out of 300, then show the NCLC level:
- `tef_score = (correct / 50) * 300`
- Map to NCLC level using the table above
- Show both: "Your score: 234/300 (NCLC 5)"

### 3.6 TEF Test JSON Schema

File: `assets/data/tef_tests/tef_ce_001.json` (one file per practice test)

```json
{
  "id": "tef_ce_001",
  "title": "Practice Test 1",
  "type": "comprehension_ecrite",
  "timeLimitMinutes": 60,
  "sections": [
    {
      "id": "A",
      "title": "Section A - Short Texts",
      "instructions": "Lisez les textes suivants et repondez aux questions.",
      "passages": [
        {
          "id": "tef_ce_001_A_01",
          "text": "PHARMACIE DUPONT\nOuverte du lundi au samedi\n9h - 19h\nFermee le dimanche et les jours feries\nService de garde: 01 23 45 67 89",
          "textType": "sign",
          "questions": [
            {
              "id": "tef_ce_001_A_01_q1",
              "question": "Quand la pharmacie est-elle fermee?",
              "options": [
                "Le samedi",
                "Le dimanche",
                "Le lundi",
                "Tous les jours"
              ],
              "correctIndex": 1,
              "explanation": "The sign states 'Fermee le dimanche et les jours feries' (Closed on Sundays and public holidays)."
            }
          ]
        }
      ]
    }
  ]
}
```

### 3.7 TEF Test JSON Field Definitions

**Test level**:
| Field | Type | Description |
|---|---|---|
| `id` | string | Unique test ID: `tef_ce_XXX` |
| `title` | string | Display title |
| `type` | string | Always `comprehension_ecrite` for MVP |
| `timeLimitMinutes` | int | 60 for CE |
| `sections` | array | Array of section objects (A, B, C, D) |

**Section level**:
| Field | Type | Description |
|---|---|---|
| `id` | string | Section letter: A, B, C, or D |
| `title` | string | Section display title |
| `instructions` | string | Instructions in French (shown before section) |
| `passages` | array | Array of passage objects |

**Passage level**:
| Field | Type | Description |
|---|---|---|
| `id` | string | Unique passage ID |
| `text` | string | The French passage text. Use `\n` for line breaks. |
| `textType` | string | One of: `sign`, `notice`, `ad`, `email`, `article`, `letter`, `instructions`, `opinion`, `formal_document` |
| `questions` | array | Array of question objects |

**Question level**:
| Field | Type | Description |
|---|---|---|
| `id` | string | Unique question ID |
| `question` | string | The question in French |
| `options` | array[4] | Exactly 4 answer choices (strings) |
| `correctIndex` | int | 0-based index of correct answer (0-3) |
| `explanation` | string | Explanation in English (shown after answering) |

### 3.8 TEF Simulator UI Flow

1. **TEF tab** (bottom nav): Shows list of available practice tests with status (not started / in progress / completed with score)
2. **Test start screen**: Shows test title, time limit, section breakdown, "Start Test" button
3. **Test taking screen**:
   - Top bar: timer (counting down from 60:00), question number (e.g., "12/50"), section indicator
   - Passage text displayed in a card
   - Question below the passage
   - 4 radio button options (A, B, C, D)
   - "Next" button (enabled after selecting an answer)
   - User can navigate back to previous questions to change answers
   - "Submit Test" button after question 50 (or accessible from any question via overflow menu)
4. **Results screen**:
   - Score: X/50 correct
   - TEF score: Y/300
   - NCLC level with color coding (red < NCLC 5, green >= NCLC 5)
   - Section breakdown: score per section (A, B, C, D)
   - "Review Answers" button to see each question with correct/incorrect marking and explanations
5. **Review mode**: Scrollable list of all questions, showing passage + question + selected answer + correct answer + explanation. Incorrect answers highlighted in red, correct in green.

### 3.9 Dart Model

File: `lib/models/tef_test.dart`

```dart
class TefTest {
  final String id;
  final String title;
  final String type;
  final int timeLimitMinutes;
  final List<TefSection> sections;
}

class TefSection {
  final String id;
  final String title;
  final String instructions;
  final List<TefPassage> passages;
}

class TefPassage {
  final String id;
  final String text;
  final String textType;
  final List<TefQuestion> questions;
}

class TefQuestion {
  final String id;
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;
}
```

### 3.10 TEF Progress Persistence

TEF test results are stored in SharedPreferences via a new field on `UserProgress`:

```dart
// Add to UserProgress model:
final Map<String, TefTestResult> tefResults; // keyed by test ID

class TefTestResult {
  final String testId;
  final int correctCount;    // out of 50
  final int tefScore;        // out of 300
  final int nclcLevel;       // 4-8+
  final String completedDate; // ISO 8601
  final Map<String, int> sectionScores; // {"A": 12, "B": 13, ...}
  final List<int> userAnswers; // user's selected option index per question (for review)
}
```

Add `recordTefResult(TefTestResult result)` to `ProgressNotifier`.

### 3.11 TEF Test Discovery

The app needs to know which test files are available. Since Flutter cannot list asset directory contents at runtime, add a manifest file:

File: `assets/data/tef_tests/manifest.json`
```json
{
  "tests": ["tef_ce_001", "tef_ce_002", "tef_ce_003"]
}
```

The data repository reads this manifest first, then loads individual test files on demand.

### 3.12 MVP Data Target

- **3 complete practice tests** (tef_ce_001, tef_ce_002, tef_ce_003), each with 20 questions
- Each test should have a mix of difficulty across sections A-D
- All passages and questions in French, explanations in English
- Passages should be original (not copied from real TEF exams) but realistic in style and difficulty

---

## 4. Audio Pronunciation

### 4.1 Technology

Use the `flutter_tts` package with the French locale (`fr-FR`).

Add to `pubspec.yaml`:
```yaml
dependencies:
  flutter_tts: ^4.2.0
```

### 4.2 TTS Configuration

```dart
final tts = FlutterTts();
await tts.setLanguage('fr-FR');
await tts.setSpeechRate(0.45);  // Slower for learners (default is ~0.5)
await tts.setVolume(1.0);
await tts.setPitch(1.0);
```

**Note**: `setSpeechRate` values vary by platform. 0.45 gives roughly 0.8x normal speed on both iOS and Android. Test on device and adjust if needed.

### 4.3 Where TTS Appears

TTS speaker icons appear in these locations:

| Screen | What is spoken | Trigger |
|---|---|---|
| Vocabulary flashcard (front) | The French word | Tap speaker icon |
| Vocabulary flashcard (back) | The French example sentence | Tap speaker icon |
| Vocabulary browse detail | The French word + example | Tap speaker icon |
| Lesson phrases | The French phrase | Tap speaker icon |
| TEF passage | The full passage text | Tap speaker icon (optional, for reading along) |
| Quiz question | The French text in the question | Tap speaker icon |

### 4.4 UX Rules

1. **Tap to hear, never auto-play.** Users control when audio plays. No sounds on page load.
2. **Speaker icon**: Use `Icons.volume_up_rounded`. Place it to the right of the French text, vertically centered.
3. **Visual feedback**: Icon briefly pulses or changes color while TTS is speaking. Disable icon (gray out) while already speaking to prevent double-tap.
4. **Error handling**: If TTS is unavailable (e.g., no French voice installed), hide the speaker icon. Do not show errors.

### 4.5 TTS Provider

Create a simple singleton provider:

```dart
final ttsProvider = Provider<TtsService>((ref) {
  ref.keepAlive();
  return TtsService();
});

class TtsService {
  final FlutterTts _tts = FlutterTts();
  bool _initialized = false;

  Future<void> _init() async {
    if (_initialized) return;
    await _tts.setLanguage('fr-FR');
    await _tts.setSpeechRate(0.45);
    await _tts.setVolume(1.0);
    _initialized = true;
  }

  Future<void> speak(String text) async {
    await _init();
    await _tts.stop();
    await _tts.speak(text);
  }

  Future<void> stop() async {
    await _tts.stop();
  }
}
```

---

## 5. Navigation Reorganization

### 5.1 New Bottom Navigation

Replace the current 5-tab layout with 4 tabs:

| Index | Icon | Label | Route | Screen |
|---|---|---|---|---|
| 0 | `Icons.menu_book_rounded` | Lessons | `/lessons` | Lessons list |
| 1 | `Icons.translate_rounded` | Words | `/words` | Vocabulary trainer |
| 2 | `Icons.school_rounded` | TEF | `/tef` | TEF test simulator |
| 3 | `Icons.quiz_rounded` | Quiz | `/quiz` | Chapter quizzes |

**Removed**: Home tab (redundant with Lessons), Profile tab (move settings/dark mode toggle to app bar)

### 5.2 Default Tab

The app opens to **Lessons** (`/lessons`) as the default tab after splash. This is the primary learning path.

Update the splash screen redirect: currently `SplashScreen` navigates to `/` (home). Change this to navigate to `/lessons` instead.

### 5.3 Each Tab: Completed Section Pattern

Every list-based tab follows this layout pattern:

```
[Header: screen title + subtitle]
[Active/incomplete items - shown first, full size]
--- divider ---
[Completed section - collapsed by default]
  [Tap to expand]
  [Completed items - shown with checkmark, slightly dimmed]
```

**What counts as "completed"**:
- **Lessons tab**: A chapter is completed when `completionPercent >= 100`
- **Words tab (categories)**: A category is completed when all words in it have `repetitions >= 3` (reviewed correctly at least 3 times)
- **TEF tab**: A test is completed when it has been submitted (regardless of score)
- **Quiz tab**: A chapter quiz is completed when `quizBestScore >= 80`

### 5.4 App Bar Actions

Since we removed the Profile tab, global actions go in the app bar:

- **Right side**: Dark mode toggle (sun/moon icon) -- see section 6
- **No left hamburger menu**. Keep it simple.
- **No XP bar or streak counter** on the main screens. These were on the old Home screen and are removed for simplicity.

### 5.5 Router Changes

Update `lib/core/router/app_router.dart`:
- Remove `/` (home) route
- Remove `/profile` route
- Change initial post-splash route to `/lessons`
- Add `/words` route (replacing `/wordbank`)
- Add `/tef` route
- Update `AppShell` bottom nav to 4 items
- Add `/tef/:testId` route for taking a specific test (parentNavigatorKey = root, with slide transition like existing lesson/quiz detail routes)

---

## 6. Dark Mode

### 6.1 Dark Palette

| Token | Light | Dark |
|---|---|---|
| `background` | `#FFFFFF` | `#121212` |
| `surface` | `#FFFFFF` | `#1E1E1E` |
| `surfaceLight` | `#F8F9FA` | `#2C2C2C` |
| `card` | `#FFFFFF` | `#2C2C2C` |
| `cardShadow` | `#1A1B2A4A` | `#00000000` (no shadow in dark) |
| `textPrimary` | `#1B2A4A` | `#E8E8E8` |
| `textSecondary` | `#5D6B7E` | `#A0A0A0` |
| `textLight` | `#6B7B8D` | `#707070` |
| `divider` | `#E8E8E8` | `#333333` |
| `navBar` | `#FFFFFF` | `#1E1E1E` |

**Accent colors stay the same** in dark mode: `red` (#E63946), `gold` (#D4A574). These already have sufficient contrast against dark backgrounds.

The `navy` color (#1B2A4A) is replaced with `#E8E8E8` for text in dark mode (it was used as text primary).

`cream` (#F1FAEE) background accents become `#2C2C2C` in dark mode.

### 6.2 Implementation Approach

1. Add `isDarkMode` to a theme provider (stored in SharedPreferences)
2. Update `AppColors` to provide colors via static methods that accept brightness, OR create a parallel `AppColorsDark` class
3. Update `AppTheme` to produce both light and dark `ThemeData`
4. Wrap `MaterialApp.router` with the theme provider to switch themes reactively

**Recommended approach**: Use a `themeProvider` Riverpod `Notifier` with `ThemeMode` state:

```dart
final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);

class ThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    final prefs = ref.read(sharedPreferencesProvider);
    final isDark = prefs.getBool('dark_mode') ?? false;
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> toggle() async {
    final prefs = ref.read(sharedPreferencesProvider);
    final newMode = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    state = newMode;
    await prefs.setBool('dark_mode', newMode == ThemeMode.dark);
  }
}
```

### 6.3 Toggle UI

A simple icon button in the app bar of the `AppShell`:

- Light mode: show `Icons.dark_mode_rounded` (moon icon, meaning "tap to switch to dark")
- Dark mode: show `Icons.light_mode_rounded` (sun icon, meaning "tap to switch to light")
- Tap toggles immediately with no confirmation dialog

### 6.4 Dark Mode Scope

All screens must support dark mode. Key areas to verify:

- Bottom navigation bar background and icon colors
- Card backgrounds (`FrenchCard` widget)
- Input fields (search bar in Words tab)
- Tab bar colors
- Quiz option buttons (selected/unselected states)
- Progress ring colors
- TEF timer and score displays
- Splash screen

---

## Appendix A: Implementation Priority

| Priority | Task | Depends On | Assignee |
|---|---|---|---|
| P0 | Vocabulary JSON data (640 words) | This spec | data-engineer |
| P0 | TEF test data (3 tests, 60 questions) | This spec | data-engineer |
| P0 | flutter_tts integration (provider + widget) | This spec | data-engineer |
| P1 | Fix lesson completion tracking bug | None | ui-developer |
| P1 | Navigation reorganization (4 tabs) | Bug fix (#2) | ui-developer |
| P1 | Dark mode support | None (parallel) | ui-developer |
| P2 | Words learning page (full vocabulary trainer) | Vocab data + TTS | ui-developer |
| P2 | TEF simulator page | TEF data | ui-developer |
| P3 | Full review and fix cycle | All P1/P2 complete | reviewer |

## Appendix B: Files to Create

| File | Purpose |
|---|---|
| `assets/data/vocabulary.json` | 640+ French vocabulary words |
| `assets/data/tef_tests/manifest.json` | TEF test manifest (list of available test IDs) |
| `assets/data/tef_tests/tef_ce_001.json` | TEF practice test 1 (20 questions) |
| `assets/data/tef_tests/tef_ce_002.json` | TEF practice test 2 (20 questions) |
| `assets/data/tef_tests/tef_ce_003.json` | TEF practice test 3 (20 questions) |
| `lib/models/vocabulary_word.dart` | VocabularyWord model |
| `lib/models/tef_test.dart` | TefTest, TefSection, TefPassage, TefQuestion models |
| `lib/models/tef_result.dart` | TefTestResult model (for progress persistence) |
| `lib/services/tts_service.dart` | TTS wrapper provider |
| `lib/screens/words/words_screen.dart` | Vocabulary trainer (replaces wordbank) |
| `lib/screens/words/flashcard_session_screen.dart` | Flashcard learning session |
| `lib/screens/words/word_detail_screen.dart` | Single word detail view |
| `lib/screens/tef/tef_screen.dart` | TEF test list |
| `lib/screens/tef/tef_test_screen.dart` | Test-taking screen |
| `lib/screens/tef/tef_results_screen.dart` | Results + review |
| `lib/providers/theme_provider.dart` | Dark mode toggle |

## Appendix C: Files to Modify

| File | Changes |
|---|---|
| `pubspec.yaml` | Add `flutter_tts` dependency, add `assets/data/tef_tests/` directory |
| `lib/core/router/app_router.dart` | Remove home/profile routes, add words/tef routes, update AppShell to 4 tabs |
| `lib/core/constants/app_colors.dart` | Add dark mode color variants |
| `lib/core/theme/app_theme.dart` | Add dark theme data |
| `lib/providers/data_provider.dart` | Add vocabulary and TEF providers |
| `lib/repositories/data_repository.dart` | Add getVocabulary() and getTefTest() methods |
| `lib/models/progress.dart` | Add `tefResults` map and `TefTestResult` class to `UserProgress` |
| `lib/models/models.dart` | Export new models |
| `lib/main.dart` | Wire theme provider to MaterialApp |
| `lib/screens/splash/splash_screen.dart` | Change redirect from `/` to `/lessons` |
