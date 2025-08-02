class AvatarApiModel {
  final String imageURL;
  final String fullName;

  AvatarApiModel({required this.imageURL, required this.fullName});

  factory AvatarApiModel.fromJson(Map<String, dynamic> json) {
    return AvatarApiModel(
      imageURL: json['imageURL'],
      fullName: json['fullName'],
    );
  }
}
