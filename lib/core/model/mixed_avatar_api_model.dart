class MixedAvatarApiModel {
  final String id;
  final String imageURL;
  final String type;
  final String? fullName;
  final String? title;
  final String? artist;

  MixedAvatarApiModel({
    required this.id,
    required this.imageURL,
    required this.type,
    this.fullName,
    this.title,
    this.artist,
  });

  factory MixedAvatarApiModel.fromJson(Map<String, dynamic> json, String type) {
    return MixedAvatarApiModel(
      id: json['_id'],
      imageURL: json['imageURL'],
      type: type,
      fullName: json['fullName'],
      title: json['title'],
      artist: json['artist'],
    );
  }
}
