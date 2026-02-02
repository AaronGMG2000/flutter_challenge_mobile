import 'dart:math';

class NameGenerator {
  static const List<String> _adjectives = ['Alpha', 'Bravo', 'Cyber', 'Dark', 'Eco', 'Frost', 'Golden'];
  static const List<String> _nouns = ['Ninja', 'Panda', 'Eagle', 'Storm', 'Wolf', 'Pixel', 'Orb'];

  static String generate() {
    final random = Random();
    String adj = _adjectives[random.nextInt(_adjectives.length)];
    String noun = _nouns[random.nextInt(_nouns.length)];
    int number = random.nextInt(999); // Para darle un toque único

    return '$adj$noun$number';
  }
}
