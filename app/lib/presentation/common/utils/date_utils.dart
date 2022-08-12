import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

final DateFormat _formatter = DateFormat("dd.MM.yyyy");

/// Returns a date formatted as `dd.MM.yyyy`.
String getFormattedDate(String time) {
  final date = DateTime.parse(time);
  return _formatter.format(date);
}

/// Returns a relative time ago string for the given date.
String getTimeAgo(String createdAt) {
  final now = DateTime.now();
  final difference = now.difference(DateTime.parse(createdAt));
  return timeago.format(now.subtract(difference));
}
