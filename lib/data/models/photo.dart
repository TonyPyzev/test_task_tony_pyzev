class Photo {
  final String id;
  final String userName;
  final String? description;
  final Map<String, dynamic> urls;

  Photo({
    required this.id,
    required this.userName,
    required this.description,
    required this.urls,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      userName: json['user']['name'],
      description: json['description'],
      urls: json['urls'],
    );
  }

  @override
  String toString() {
    return '$id, $userName, $description, $urls\n';
  }
}
