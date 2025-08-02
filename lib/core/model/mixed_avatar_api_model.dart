class MixedAvatarApiModel {
  final String imageURL;
  final String fullName;
  final String type;

  MixedAvatarApiModel({
    required this.type,
    required this.imageURL,
    required this.fullName,
  });

  factory MixedAvatarApiModel.fromJson(Map<String, dynamic> json) {
    return MixedAvatarApiModel(
      imageURL: json['imageURL'],
      fullName: json['fullName'],
      type: json['type'],
    );
  }
}
