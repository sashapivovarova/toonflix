typedef Settings = Map<String, String>;

class Dictionary {
  final Settings word = {};

  void add(String term, String definition) {
    word[term] = definition;
  }

  String get(String term) {
    return word[term] ?? "Term was not found";
  }

  void delete(String term) {
    word.remove(term);
  }

  void update(String term, String definition) {
    if (word.containsKey(term)) {
      word[term] = definition;
    }
  }

  void showAll() {
    word.forEach((term, definition) {
      print('$term: $definition');
    });
  }

  int count() {
    return word.length;
  }

  void upsert(String term, String definition) {
    word[term] = definition;
  }

  bool exists(String term) {
    return word.containsKey(term);
  }

  void bulkAdd(List<Settings> terms) {
    for (var termData in terms) {
      final term = termData['term'];
      final definition = termData['definition'];
      if (term != null && definition != null) {
        word[term] = definition;
      }
    }
  }

  void bulkDelete(List<String> terms) {
    for (var term in terms) {
      word.remove(term);
    }
  }
}

void main() {
  Dictionary myDictionary = Dictionary();

  myDictionary.add("apple", "A fruit with a red or green skin.");

  print(myDictionary.get("apple"));

  myDictionary.update("apple", "A long curved fruit that grows in bunches.");

  myDictionary.showAll();

  print(myDictionary.count());

  print(myDictionary.exists("dog"));

  myDictionary.bulkAdd([
    {"term": "dog", "definition": "A domesticated carnivorous mammal."},
    {
      "term": "elephant",
      "definition": "A large herbivorous mammal with a trunk."
    },
  ]);

  myDictionary.showAll();

  myDictionary.bulkDelete(["apple", "dog"]);

  myDictionary.showAll();
}
