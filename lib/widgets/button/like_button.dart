import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  final bool initialLike;
  final double? size;

  const LikeButton({super.key, this.initialLike = false, this.size});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late bool _isLiked;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.initialLike;
  }

  void _changeLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeLike,

      child: Icon(
        _isLiked ? Icons.favorite : Icons.favorite_border,
        color: _isLiked ? Theme.of(context).primaryColor : Colors.grey,
        size: widget.size,
      ),
    );
  }
}
