import 'package:flutter/material.dart';

class VerseWidget extends StatelessWidget {
  final String verse;
  final int verseNumber;

  const VerseWidget({
    super.key,
    required this.verse,
    required this.verseNumber,
  });
  // hello menna
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      '$verse($verseNumber)',
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
