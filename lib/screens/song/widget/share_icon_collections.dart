import 'package:flutter/material.dart';

class ShareIconCollections extends StatelessWidget {
  const ShareIconCollections({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20, // vertical space between rows
      children: const [
        _ShareIcon(
          iconUrl:
              "https://res.cloudinary.com/duhbs7hqv/image/upload/v1755986959/copy_link_kcmb1b.png",
          label: "Copy Link",
        ),
        _ShareIcon(
          iconUrl:
              "https://res.cloudinary.com/duhbs7hqv/image/upload/v1755986960/whatsapp_jwpfnu.png",
          label: "Whatsapp",
        ),
        _ShareIcon(
          iconUrl:
              "https://res.cloudinary.com/duhbs7hqv/image/upload/v1755986961/twitter_lnycn5.webp",
          label: "Twitter",
        ),
        _ShareIcon(
          iconUrl:
              "https://res.cloudinary.com/duhbs7hqv/image/upload/v1755986962/imessage_ldntjg.png",
          label: "Messages",
        ),
        _ShareIcon(
          iconUrl:
              "https://res.cloudinary.com/duhbs7hqv/image/upload/v1755986964/more_blfboo.png",
          label: "See More",
        ),
      ],
    );
  }
}

class _ShareIcon extends StatelessWidget {
  final String iconUrl;
  final String label;
  const _ShareIcon({required this.iconUrl, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Image.network(
              iconUrl,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(label),
      ],
    );
  }
}
