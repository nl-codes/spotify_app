import 'package:flutter/material.dart';
import 'package:spotify_app/utils/string_manipulate.dart';

class LibraryFilterOptions extends StatefulWidget {
  const LibraryFilterOptions({super.key});

  @override
  State<LibraryFilterOptions> createState() => _LibraryFilterOptionsState();
}

class _LibraryFilterOptionsState extends State<LibraryFilterOptions> {
  _FilterOption _selectedOption = _FilterOption.all;

  final List<_FilterOption> _options = [
    _FilterOption.all,
    _FilterOption.playlist,
    _FilterOption.artists,
    _FilterOption.albums,
    _FilterOption.podcasts,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _options.map((option) {
        final isSelected = option == _selectedOption;
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: _FilterCard(
            isSelected: isSelected,
            option: option,
            onTap: () => setState(() => _selectedOption = option),
          ),
        );
      }).toList(),
    );
  }
}

enum _FilterOption { all, playlist, artists, albums, podcasts }

class _FilterCard extends StatelessWidget {
  final bool isSelected;
  final _FilterOption option;
  final VoidCallback? onTap; // added to handle tap
  const _FilterCard({
    required this.isSelected,
    required this.option,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey : null,
          border: isSelected
              ? null
              : Border.all(width: 0.5, color: Colors.white),
          borderRadius: BorderRadius.circular(100),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          convertToSentenceCas(option.name),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
