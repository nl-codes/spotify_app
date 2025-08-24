import 'package:flutter/material.dart';

enum SelectionAvatarType { artist, podcast }

class SelectAvatar extends StatefulWidget {
  final String imageURL;
  final String fullName;
  final SelectionAvatarType type;
  const SelectAvatar({
    super.key,
    required this.imageURL,
    required this.fullName,
    required this.type,
  });

  @override
  State<SelectAvatar> createState() => _SelectAvatarState();
}

class _SelectAvatarState extends State<SelectAvatar> {
  bool isSelected = false;

  void _toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isArtist = widget.type == SelectionAvatarType.artist;
    return GestureDetector(
      onTap: _toggleSelection,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              isArtist
                  ? CircleAvatar(
                      radius: 40,
                      foregroundImage: NetworkImage(widget.imageURL),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        widget.imageURL,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
              // Selection overlay
              if (isSelected)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.7),
                      borderRadius: isArtist
                          ? BorderRadius.circular(40)
                          : BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: 80,
            child: Text(
              textAlign: TextAlign.center,
              widget.fullName,
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }
}
