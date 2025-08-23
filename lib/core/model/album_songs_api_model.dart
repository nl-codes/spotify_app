class AlbumSongsApiModel {
  final String id;
  final String artistId;
  final int yearReleased;
  final String albumURL;
  final String albumTitle;
  final String albumColor;
  final String artistURL;
  final String artistName;
  final List<Song> songs;

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
          .map((song) => Song.fromJson(song))
          .toList(),
    );
  }
}

class Song {
  final String id;
  final String title;
  final int trackNumber;
  final String duration;

  Song({
    required this.id,
    required this.title,
    required this.trackNumber,
    required this.duration,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      trackNumber: json['trackNumber'] ?? 0,
      duration: json['duration'] ?? '',
    );
  }
}
