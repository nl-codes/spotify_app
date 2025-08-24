class AlbumApiModel {
  final String albumId;
  final String imageURL;
  final String title;
  final String artist;

  AlbumApiModel({
    required this.albumId,
    required this.title,
    required this.artist,
    required this.imageURL,
  });

  factory AlbumApiModel.fromJson(Map<String, dynamic> json) {
    return AlbumApiModel(
      imageURL: json['imageURL'],
      albumId: json['_id'],
      title: json['title'],
      artist: json['artist'],
    );
  }
}
