import 'package:flutter/material.dart';
import 'package:spotify_app/widgets/profile_icon.dart';
import 'package:spotify_app/widgets/volume_slider.dart';

void showSelectDevices(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    isDismissible: true,
    enableDrag: true,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.9,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(18, 18, 18, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                children: [
                  _Handle(),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _ListeningOn(),
                          SizedBox(height: 28),
                          Text(
                            "Select a device",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          _GoogleCast(),
                          SizedBox(height: 28),
                          _Macbook(),
                          SizedBox(height: 28),
                          _Airplay(),
                          SizedBox(height: 28),
                          _GroupSession(),
                          SizedBox(height: 16),
                          Row(children: [Expanded(child: _SessionJaam())]),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: VolumeSlider(),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

class _Handle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      width: 56,
      height: 6,
      decoration: BoxDecoration(
        color: Color.fromRGBO(83, 83, 83, 1),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class _ListeningOn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/images/frequency.png",
          width: 40,
          height: 40,
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Listening on",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.bluetooth,
                    color: Theme.of(context).primaryColor,
                    size: 12,
                  ),
                  Text(
                    " Narayan's Airpods",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.close),
        ),
      ],
    );
  }
}

class _GoogleCast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.tv, color: Colors.grey),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("BRAVIA 4K GB", style: TextStyle(fontSize: 16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.cast, size: 12, color: Colors.grey),
                SizedBox(width: 4),
                Text("Google Cast", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _Macbook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.laptop_mac, color: Colors.grey),
        SizedBox(width: 16),
        Expanded(
          child: Text("Narayan's Macbook", style: TextStyle(fontSize: 16)),
        ),
        Icon(Icons.more_horiz, color: Colors.grey),
      ],
    );
  }
}

class _Airplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.airplay_rounded, color: Colors.grey),
        SizedBox(width: 16),
        Expanded(
          child: Text("Airplay or Blueetooth", style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}

class _GroupSession extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Start a Group Session",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(196, 196, 196, 1),
                borderRadius: BorderRadius.circular(2),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
              child: Text(
                "BETA",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          "Listen with friends, in real time. Pick what  to play and control the music together.",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

class _SessionJaam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileIcon(),
        SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Text(
            "Start Session",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () =>
              Navigator.pushReplacementNamed(context, '/search/camera'),
          child: Container(
            decoration: BoxDecoration(
              border: BoxBorder.all(color: Colors.white),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Text(
              "Scan to join",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
