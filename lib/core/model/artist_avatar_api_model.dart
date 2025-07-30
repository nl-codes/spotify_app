// To parse this JSON data, do
//
//     final artistAvatarApiModel = artistAvatarApiModelFromJson(jsonString);

// import 'dart:convert';

// List<ArtistAvatarApiModel> artistAvatarApiModelFromJson(String str) =>
//     List<ArtistAvatarApiModel>.from(
//       json.decode(str).map((x) => ArtistAvatarApiModel.fromJson(x)),
//     );

// String artistAvatarApiModelToJson(List<ArtistAvatarApiModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class ArtistAvatarApiModel {
//   final String? id;
//   final String? imageUrl;
//   final String? fullName;

//   ArtistAvatarApiModel({this.id, this.imageUrl, this.fullName});

//   factory ArtistAvatarApiModel.fromJson(Map<String, dynamic> json) =>
//       ArtistAvatarApiModel(
//         id: json["_id"],
//         imageUrl: json["imageURL"],
//         fullName: json["fullName"],
//       );

//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "imageURL": imageUrl,
//     "fullName": fullName,
//   };
// }

class ArtistAvatarApiModel {
  final String imageURL;
  final String fullName;

  ArtistAvatarApiModel({required this.imageURL, required this.fullName});

  factory ArtistAvatarApiModel.fromJson(Map<String, dynamic> json) {
    return ArtistAvatarApiModel(
      imageURL: json['imageURL'],
      fullName: json['fullName'],
    );
  }
}
