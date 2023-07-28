typedef LookupFunction = String Function(String term);

class Dictionary {
  final Map<String, String> _data = {};

  void add(String term, String definition) {
    _data[term] = definition;
  }

  String get(String term) {
    return _data[term] ?? "Definition not found";
  }

  void delete(String term) {
    _data.remove(term);
  }

  void update(String term, String definition) {
    if (_data.containsKey(term)) {
      _data[term] = definition;
    } else {
      print("Term '$term' not found in the dictionary.");
    }
  }

  void showAll() {
    _data.forEach((term, definition) {
      print('$term: $definition');
    });
  }

  int count() {
    return _data.length;
  }

  void upsert(String term, String definition) {
    _data[term] = definition;
  }

  bool exists(String term) {
    return _data.containsKey(term);
  }

  void bulkAdd(List<Map<String, String>> terms) {
    for (var termData in terms) {
      final term = termData['term'];
      final definition = termData['definition'];
      if (term != null && definition != null) {
        _data[term] = definition;
      }
    }
  }

  void bulkDelete(List<String> terms) {
    for (var term in terms) {
      _data.remove(term);
    }
  }
}

void main() {
  Dictionary myDictionary = Dictionary();

  myDictionary.add("apple", "A fruit with a red or green skin.");
  myDictionary.add("banana", "A fruit with a yellow skin.");
  myDictionary.add("cat", "A small domesticated carnivorous mammal.");

  print(myDictionary.get("apple"));

  myDictionary.update("banana", "A long curved fruit that grows in bunches.");

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

  myDictionary.bulkDelete(["apple", "cat"]);

  myDictionary.showAll();
}
