import 'package:flutter/material.dart';
import 'package:spotify_app/utils/string_manipulate.dart';

class LibraryFilterOptions extends StatefulWidget {
  final ValueChanged<FilterOption> onFilterSelected;
  const LibraryFilterOptions({super.key, required this.onFilterSelected});

  @override
  State<LibraryFilterOptions> createState() => _LibraryFilterOptionsState();
}

class _LibraryFilterOptionsState extends State<LibraryFilterOptions> {
  FilterOption _selectedOption = FilterOption.all;

  final List<FilterOption> _options = [
    FilterOption.all,
    FilterOption.songs,
    FilterOption.artists,
    FilterOption.albums,
    FilterOption.podcasts,
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
            onTap: () {
              setState(() => _selectedOption = option);
              widget.onFilterSelected(option);
            },
          ),
        );
      }).toList(),
    );
  }
}

enum FilterOption { all, songs, artists, albums, podcasts }

class _FilterCard extends StatelessWidget {
  final bool isSelected;
  final FilterOption option;
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
