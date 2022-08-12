import 'dart:convert';

class TrimmedVideo {
  final String url;
  final int duration;

  TrimmedVideo(
    this.url,
    this.duration,
  );

  TrimmedVideo copyWith({
    String? url,
    int? duration,
  }) {
    return TrimmedVideo(
      url ?? this.url,
      duration ?? this.duration,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'duration': duration,
    };
  }

  factory TrimmedVideo.fromMap(Map<String, dynamic> map) {
    return TrimmedVideo(
      map['url'] ?? '',
      map['duration']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TrimmedVideo.fromJson(String source) =>
      TrimmedVideo.fromMap(json.decode(source));

  @override
  String toString() => 'TrimmedVideo(url: $url, duration: $duration)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrimmedVideo &&
        other.url == url &&
        other.duration == duration;
  }

  @override
  int get hashCode => url.hashCode ^ duration.hashCode;
}
