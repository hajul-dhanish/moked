class Data {
  final String username;
  final String content;

  Data({required this.username, required this.content});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      username: json['username'],
      content: json['content'],
    );
  }
}
