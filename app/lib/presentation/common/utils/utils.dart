/// Returns a duration formatted as `mm:ss`.
String getDurationString(int seconds) {
  final duration = Duration(seconds: seconds);
  final minString = duration.inMinutes.toString().padLeft(2, "0");
  final secString = duration.inSeconds.remainder(60).toString().padLeft(2, "0");
  return "$minString:$secString";
}

/// Returns the initials of the username.
///
/// If only one name is provided only returns one letter.
/// If the user has multiple names it only returns the first and last initial.
String getInitials(String username) {
  final names = username.trim().split(" ");
  if (names.length == 1) return names.first[0];
  return names.first[0] + names.last[0];
}

/// Returns true if the given string is an url.
bool isURL(String fileUrl) {
  try {
    return Uri.parse(fileUrl).isAbsolute;
  } catch (err) {
    return false;
  }
}
