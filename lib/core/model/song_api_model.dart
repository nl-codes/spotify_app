class SongApiModel {
  final String imageURL;
  final String title;
  final String artist;

  SongApiModel({
    required this.imageURL,
    required this.artist,
    required this.title,
  });

  factory SongApiModel.fromJson(Map<String, dynamic> json) {
    return SongApiModel(
      imageURL: json['imageURL'],
      title: json['title'],
      artist: json['artist'],
    );
  }
}
