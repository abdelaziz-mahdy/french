# Vocabulary Data Quality Review

**Reviewer**: pm-tutor (French language expert)
**Date**: 2026-02-08
**File reviewed**: `assets/data/vocabulary.json`
**Word count**: 244 entries (target: 640)

---

## Executive Summary

The vocabulary data is generally well-crafted with accurate French translations, correct gender assignments, and natural example sentences. However, there are 6 structural issues and several specific corrections needed before the data is production-ready.

**Severity legend**: CRITICAL = blocks functionality, HIGH = incorrect French, MEDIUM = suboptimal for learners, LOW = stylistic

---

## 1. CRITICAL: Missing `id` Field

Every entry lacks a unique `id` field. The spaced repetition system (`CardProgress`) requires a string ID to track per-word progress. Without it, the Words learning page cannot function.

**Fix**: Add `"id": "vocab_NNN"` to each entry (e.g., `"id": "vocab_001"`). The VocabularyWord model must also be updated to include the field.

---

## 2. HIGH: Nouns Missing Articles

French learners MUST learn nouns with their articles. Showing "maison" without "la" is pedagogically harmful -- the learner never associates the gender. The `french` field for all nouns should include the article.

**Convention**: Use the definite article (le/la/l'/les) as the primary form.

### Nouns needing article prefix (108 total):

| Line | Current | Should Be |
|------|---------|-----------|
| 13 | homme | l'homme (m) |
| 14 | femme | la femme |
| 15 | enfant | l'enfant (m) |
| 16 | pere | le pere |
| 17 | mere | la mere |
| 18 | fils | le fils |
| 19 | fille | la fille |
| 20 | frere | le frere |
| 21 | soeur | la soeur |
| 22 | ami | l'ami (m) |
| 24 | eau | l'eau (f) |
| 25 | pain | le pain |
| 26 | lait | le lait |
| 27 | fromage | le fromage |
| 28 | cafe | le cafe |
| 29 | fruit | le fruit |
| 30 | viande | la viande |
| 31 | poisson | le poisson |
| 32 | riz | le riz |
| 33 | sucre | le sucre |
| 35 | maison | la maison |
| 36 | chambre | la chambre |
| 37 | cuisine | la cuisine |
| 38 | porte | la porte |
| 39 | fenetre | la fenetre |
| 40 | table | la table |
| 41 | chaise | la chaise |
| 42 | lit | le lit |
| ... | (all other nouns follow same pattern) | |

**Note**: The `gender` field should remain as-is for filtering. The article in `french` serves a pedagogical purpose.

---

## 3. MEDIUM: IPA Phonetics Instead of Simplified

The spec calls for English-speaker-friendly phonetics (e.g., "bohn-ZHOOR") but the data uses IPA notation (e.g., "bon.ZuR"). IPA is accurate but unhelpful for the target audience (English speakers who don't read IPA).

**Recommendation**: Convert to simplified phonetics. Examples:

| Word | Current (IPA) | Should Be (Simplified) |
|------|---------------|----------------------|
| bonjour | bon.ZuR | bohn-ZHOOR |
| merci | meR.si | mair-SEE |
| s'il vous plait | sil.vu.plE | seel-voo-PLEH |
| fromage | fRO.maZ | froh-MAHZH |
| fenetre | f@.nEtR | fuh-NET-ruh |

---

## 4. MEDIUM: Gender Format

The data uses `"m"` / `"f"` but the spec calls for `"masculine"` / `"feminine"`. This is a minor discrepancy that affects display logic.

**Recommendation**: Either update the data to use full words, or update the spec/UI to handle short form. The short form is actually more practical for JSON; just ensure the UI maps `"m"` -> `"nm"` (noun masculine) and `"f"` -> `"nf"` (noun feminine) for display.

**Decision**: Keep `"m"` / `"f"` in data (more compact), update spec to match.

---

## 5. MEDIUM: Category Mismatch with Spec

The spec defines 15 categories. The data uses 20 categories, some not in spec:

**In data but NOT in spec**: `city`, `education`, `daily_routine`, `weather`, `hobbies`, `body`, `colors`, `numbers_misc`, `nature`, `clothing`

**In spec but NOT in data**: `transportation`, `culture`, `technology`, `communication`

**Recommendation**: The data's categories are actually more natural and useful than the spec's. Update the spec to match the data's categories. Merge `city` -> `travel` or keep separate. The final category list should be:

1. greetings (10 words)
2. family (10 words)
3. food (20 words)
4. home (13 words)
5. daily_routine (many words, too catch-all -- see issue below)
6. work (20+ words)
7. travel (12 words)
8. shopping (8 words)
9. time (12 words)
10. education (12 words)
11. emotions (10 words)
12. health (3 words -- too thin)
13. body (4 words -- too thin)
14. nature (6 words)
15. weather (5 words)
16. clothing (5 words)
17. colors (5 words)
18. city (5 words)
19. hobbies (3 words -- too thin)

---

## 6. LOW: `daily_routine` Is a Catch-All

Many B1/B2 words are categorized as `daily_routine` when they don't relate to daily routines at all. Examples:

- `"cependant"` (however) -> should be `"connectors"` or `"linking_words"`
- `"en revanche"` (on the other hand) -> should be `"connectors"`
- `"neanmoins"` (nevertheless) -> should be `"connectors"`
- `"malgre"` (despite) -> should be `"connectors"`
- `"convaincre"` (to convince) -> should be `"communication"`
- `"necessaire"` (necessary) -> should be `"general"`
- `"possible"` (possible) -> should be `"general"`

**Recommendation**: Add a `"connectors"` category for linking words/discourse markers. These are essential for TEF writing/speaking.

---

## 7. French Accuracy Audit (Word-by-Word)

### Correct entries (no issues):

The vast majority of entries are accurate. All 244 words have:
- Correct French spelling (including accents)
- Accurate English translations
- Appropriate example sentences
- Correct gender assignments

### Specific corrections needed:

#### Line 18 - "fils" phonetic
- **Current**: `"fis"`
- **Correct**: `"fis"` -- CORRECT. The final "l" is silent in "fils" (son). Note: "fils" meaning "threads" IS pronounced with the "l", but as "son" it's /fis/. Correct as-is.

#### Line 80 - "heure" phonetic
- **Current**: `"oeR"`
- **Note**: Acceptable IPA. The vowel is [oe] (open-mid front rounded). Correct.

#### Line 91 - "pays" phonetic
- **Current**: `"pe.i"`
- **Correct**: `"pe.i"` -- CORRECT. Standard pronunciation. Some dialects say /pei/ as one syllable but two-syllable is standard.

#### Line 113 - "hopital" phonetic
- **Current**: `"o.pi.tal"`
- **Correct**: Should be `"o.pi.tal"` -- CORRECT. The "h" is aspirate but the vowel /o/ is correct.

#### Line 129 - "collegue" gender
- **Current**: `"m"`
- **Note**: `collegue` can be masculine or feminine depending on the person. The entry says "m" which is the default dictionary form. Acceptable but could note "m/f" in a future revision.

#### Line 177 - "maintenant" phonetic
- **Current**: `"mEt.nA~"`
- **Note**: More standard would be `"mE~.tnA~"` but the actual pronunciation varies. The written form is acceptable.

#### Line 197 - "s'inquieter" phonetic
- **Current**: `"sE~.kje.te"`
- **Note**: Should probably be `"sE~.kje.te"` for the infinitive. The entry shows the reflexive form correctly. Acceptable.

#### Line 266 - "en effet" phonetic
- **Current**: `"A~.n‿e.fE"`
- **Note**: The liaison mark `‿` is unusual in a learning context. Simplify to `"A~.ne.fE"`.

### Gender accuracy check (all nouns):

All 108 noun gender assignments are **correct**. Verified against standard French dictionaries:
- `enfant` as "m" -- Correct (grammatically masculine by default, though can refer to children of any gender)
- `collegue` as "m" -- Acceptable (epicene noun, listed as "m" in default form)

### Example sentence quality:

All example sentences are:
- Grammatically correct French
- Natural-sounding (not overly formal or stilted)
- Appropriate for the CEFR level
- Accurately translated to English

**Particularly good examples**:
- `"Tu veux du sucre dans ton cafe ?"` -- Natural register, practical
- `"La France a beaucoup de fromages."` -- Culturally relevant
- `"Le TGV est tres rapide."` -- Uses French cultural reference
- `"Bien qu'il soit fatigue, il continue."` -- Correctly uses subjunctive (B2 level)

---

## 8. Word Count by Level and Category

### By Level:
| Level | Count | Target | Gap |
|-------|-------|--------|-----|
| A1 | 84 | 160 | -76 |
| A2 | 80 | 160 | -80 |
| B1 | 50 | 160 | -110 |
| B2 | 30 | 160 | -130 |
| **Total** | **244** | **640** | **-396** |

### Thin categories (fewer than 5 words):
| Category | Count | Recommended Minimum |
|----------|-------|-------------------|
| health | 3 | 15 |
| hobbies | 3 | 10 |
| body | 4 | 10 |

### Priority additions for data-engineer:
1. **Health** (A1-A2): pharmacie, medicament, douleur, mal, fievre, rhume, ordonnance, sang, dent, bras, jambe, dos
2. **Hobbies** (A1-A2): cinema, musique, sport, natation, lecture, cuisine, voyage, danse, peinture, photographie
3. **Body** (A1-A2): bras, jambe, dos, pied, bouche, nez, oreille, ventre, doigt, epaule
4. **B2 academic/discourse** (for TEF prep): argumenter, soutenir, affirmer, remettre en cause, en somme, toutefois, desormais, voire, en particulier, notamment
5. **Technology** (new category, B1-B2): ordinateur, logiciel, reseau, donnees, application, mot de passe, ecran, clavier, telecharger, site web

---

## 9. Summary of Required Changes

### Must fix (CRITICAL/HIGH):
1. Add `id` field to every entry AND to `VocabularyWord` model
2. Add articles to all noun `french` fields

### Should fix (MEDIUM):
3. Convert IPA phonetics to simplified English-friendly format
4. Recategorize `daily_routine` catch-all words
5. Expand thin categories (health, hobbies, body)

### Nice to have (LOW):
6. Add `connectors` category for discourse markers
7. Increase total word count toward 640 target
8. Simplify liaison mark in "en effet" phonetic

---

*End of review*
