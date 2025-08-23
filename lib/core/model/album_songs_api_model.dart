class AlbumSongsApiModel {
  final String id;
  final String artistId;
  final int yearReleased;
  final String albumURL;
  final String albumTitle;
  final String albumColor;
  final String artistURL;
  final String artistName;
  final List<SongApiModel> songs;

  AlbumSongsApiModel({
    required this.id,
    required this.artistId,
    required this.yearReleased,
    required this.albumURL,
    required this.albumTitle,
    required this.albumColor,
    required this.artistURL,
    required this.artistName,
    required this.songs,
  });

  factory AlbumSongsApiModel.fromJson(Map<String, dynamic> json) {
    return AlbumSongsApiModel(
      id: json['id'] ?? '',
      artistId: json['artistId'] ?? '',
      yearReleased: json['yearReleased'] ?? 0,
      albumURL: json['albumURL'] ?? '',
      albumTitle: json['albumTitle'] ?? '',
      albumColor: json['albumHex'] ?? '',
      artistURL: json['artistURL'] ?? '',
      artistName: json['artistName'] ?? '',
      songs: (json['songs'] as List<dynamic>? ?? [])
          .map((song) => SongApiModel.fromJson(song))
          .toList(),
    );
  }
}

class SongApiModel {
  final String id;
  final String title;
  final int trackNumber;
  final String duration;

  SongApiModel({
    required this.id,
    required this.title,
    required this.trackNumber,
    required this.duration,
  });

  factory SongApiModel.fromJson(Map<String, dynamic> json) {
    return SongApiModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      trackNumber: json['trackNumber'] ?? 0,
      duration: json['duration'] ?? '',
    );
  }
}
