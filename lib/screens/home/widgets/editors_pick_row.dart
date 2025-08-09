import 'package:flutter/material.dart';

class EditorsPickRow extends StatelessWidget {
  const EditorsPickRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Card(
            imageUrl:
                "https://i.scdn.co/image/ab67706f0000000205ea78beb067ecbd2775fc89",
            description: "Ed Sheeran, Big Sean, Juice WRLD, Post Malone",
          ),
          SizedBox(width: 16),

          _Card(
            imageUrl:
                "https://epigram.org.uk/content/images/2023/09/Event-Horizon-IMDB.jpeg",
            description: "Mitski, Tame Impala, Glass Animals, Charli XCX",
          ),
          SizedBox(width: 16),

          _Card(
            imageUrl:
                "https://i.scdn.co/image/ab67706f0000000279ad582ea8f249f2df9553fa",
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final String imageUrl;
  final String? description;

  const _Card({required this.imageUrl, this.description});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(imageUrl, height: 120, width: 120),
        SizedBox(height: 4),
        SizedBox(
          width: 120,
          child: Text(
            description ?? "",
            maxLines: 2,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 12,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
