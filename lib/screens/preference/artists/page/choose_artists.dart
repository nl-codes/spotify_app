import 'package:flutter/material.dart';
import 'package:spotify_app/core/model/artist_avatar_api_model.dart';
import 'package:spotify_app/core/network/artist_avatar_service.dart';
import 'package:spotify_app/widgets/artists/artists_avatar.dart';
import 'package:spotify_app/widgets/custom_searchbar.dart';
import 'package:spotify_app/widgets/header.dart';

class ChooseArtists extends StatefulWidget {
  const ChooseArtists({super.key});

  @override
  State<ChooseArtists> createState() => _ChooseArtistsState();
}

class _ChooseArtistsState extends State<ChooseArtists> {
  final ArtistAvatarService _service = ArtistAvatarService();
  List<ArtistAvatarApiModel> _artists = [];
  bool _isLoading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    fetchArtists();
  }

  Future<void> fetchArtists() async {
    try {
      final response = await _service.fetchArtistAvatar();
      final data = response.data as List;
      setState(() {
        _artists = data
            .map((json) => ArtistAvatarApiModel.fromJson(json))
            .toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 0),
          child: Column(
            children: [
              Header(pageTitle: "Choose three or more artists you like"),
              SizedBox(height: 20),
              CustomSearchbar(),
              SizedBox(height: 20),
              Expanded(
                child: _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : _error.isNotEmpty
                    ? Center(child: Text(_error))
                    : GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.75,
                        children: _artists.map((artist) {
                          return ArtistsAvatar(
                            imageURL: artist.imageURL,
                            fullName: artist.fullName,
                          );
                        }).toList(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
