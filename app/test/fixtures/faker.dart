import 'dart:math';

import 'package:uuid/uuid.dart';

final _random = Random();
const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

int getRandomInt(int min, int max) => _random.nextInt(max - min) + min;

String getRandomString(int length) => String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(_random.nextInt(_chars.length)),
      ),
    );

String getRandomId() => const Uuid().v4();

String getRandomName() => getRandomString(getRandomInt(6, 12));

String getRandomEmail() => "${getRandomName()}@example.com";
