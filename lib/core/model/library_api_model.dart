class LibraryApiModel {
  final String imageURL;
  final String? fullName;
  final String type;
  final String? artist;
  final String? title;

  LibraryApiModel({
    required this.imageURL,
    required this.type,
    this.fullName,
    this.artist,
    this.title,
  });

  factory LibraryApiModel.fromJson(Map<String, dynamic> json) {
    return LibraryApiModel(
      imageURL: json['imageURL'] as String,
      type: json['type'] as String,
      fullName: json['fullName'] as String?,
      artist: json['artist'] as String?,
      title: json['title'] as String?,
    );
  }
}
