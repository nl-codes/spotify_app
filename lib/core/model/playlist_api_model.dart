class PlaylistApiModel {
  final String id;
  final String imageURL;
  final String title;
  final String likes;

  PlaylistApiModel({
    required this.id,
    required this.title,
    required this.likes,
    required this.imageURL,
  });

  factory PlaylistApiModel.fromJson(Map<String, dynamic> json) {
    return PlaylistApiModel(
      id: json['_id'],
      title: json['title'],
      likes: json['likes'],
      imageURL: json['imageURL'],
    );
  }
}
