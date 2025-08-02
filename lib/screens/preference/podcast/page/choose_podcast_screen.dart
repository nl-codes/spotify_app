import 'package:flutter/material.dart';
import 'package:spotify_app/core/model/avatar_api_model.dart';
import 'package:spotify_app/core/network/podcast_avatar_service.dart';
import 'package:spotify_app/widgets/button/green_button.dart';
import 'package:spotify_app/widgets/custom_searchbar.dart';
import 'package:spotify_app/widgets/header.dart';
import 'package:spotify_app/widgets/podcasts/podcast_avatar.dart';

class ChoosePodcastScreen extends StatefulWidget {
  const ChoosePodcastScreen({super.key});

  @override
  State<ChoosePodcastScreen> createState() => _ChoosePodcastScreenState();
}

class _ChoosePodcastScreenState extends State<ChoosePodcastScreen> {
  final PodcastAvatarService _service = PodcastAvatarService();
  List<AvatarApiModel> _artists = [];
  bool _isLoading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    fetchPodcasts();
  }

  Future<void> fetchPodcasts() async {
    try {
      final response = await _service.fetchPodcastAvatar();
      final data = response.data as List;
      setState(() {
        _artists = data.map((json) => AvatarApiModel.fromJson(json)).toList();
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
          child: Stack(
            children: [
              Column(
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
                              return PodcastAvatar(
                                imageURL: artist.imageURL,
                                fullName: artist.fullName,
                              );
                            }).toList(),
                          ),
                  ),
                ],
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GreenButton(
                      gotoPath: '/home',
                      isActive: true,
                      buttonName: "Done",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
