import 'dart:math';

void shuffleList(List<dynamic> list, {int? seed}) {
  final random = seed != null ? Random(seed) : Random();
  list.shuffle(random);
}
