class Albumn {
  final String username;
  final String content;

  Albumn({required this.username, required this.content});

  factory Albumn.fromJson(Map<String, dynamic> json) {
    return Albumn(
      username: json['username'],
      content: json['content'],
    );
  }
}
