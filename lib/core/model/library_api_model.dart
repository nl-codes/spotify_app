class LibraryApiModel {
  final String id;
  final String imageURL;
  final String? fullName;
  final String type;
  final String? artist;
  final String? title;

  LibraryApiModel({
    required this.id,
    required this.imageURL,
    required this.type,
    this.fullName,
    this.artist,
    this.title,
  });

  factory LibraryApiModel.fromJson(Map<String, dynamic> json) {
    return LibraryApiModel(
      id: json['_id'] as String,
      imageURL: json['imageURL'] as String,
      type: json['type'] as String,
      fullName: json['fullName'] as String?,
      artist: json['artist'] as String?,
      title: json['title'] as String?,
    );
  }
}
