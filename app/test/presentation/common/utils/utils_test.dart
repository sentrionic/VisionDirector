import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:vision_director/presentation/common/utils/utils.dart';

void main() {
  group('getInitials', () {
    test('should return the initials for the given username', () {
      const username = "John Smith";
      final initials = getInitials(username);
      expect(initials, "JS");
    });

    test('should only return the initials of the first and last name', () {
      const username = "John William Smith";
      final initials = getInitials(username);
      expect(initials, "JS");
    });

    test('should only return one initial if only one name is provided', () {
      const username = "John";
      final initials = getInitials(username);
      expect(initials, "J");
    });
  });

  group('isUrl', () {
    test('should return true if the given string is a url', () {
      const url = "https://example.com";
      final result = isURL(url);
      expect(true, result);
    });

    test('should return false if the given string is a file path', () {
      final file = File("test.mp4");
      final result = isURL(file.path);
      expect(false, result);
    });

    test('should return false if the given string is nonsense', () {
      const url = "::Not valid URI::";
      final result = isURL(url);
      expect(false, result);
    });
  });
}
