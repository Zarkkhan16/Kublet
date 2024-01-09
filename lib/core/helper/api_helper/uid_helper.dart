import 'dart:math';

class UidHelper
{
  static String generateUniqueId() {
    DateTime now = DateTime.now();
    int timestamp = now.microsecondsSinceEpoch;
    const String characters =
        'ABCDEabcdefxyzghijkJKLMNOPQRSTUlmnopqvwFGHIVWXYZrstu';

    int randomComponent = Random().nextInt(99999);

    String uniqueId = characters[randomComponent % characters.length] +
        timestamp.toString().substring(0, 8) +
        characters[(randomComponent + 1) % characters.length] +
        timestamp.toString().substring(8, 16) +
        characters[(randomComponent + 2) % characters.length];

    return uniqueId;
  }

}