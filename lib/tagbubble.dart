import 'package:flutter/material.dart';

class tagbubble extends StatelessWidget {
  Color back;
  Color text;
  String tagName;
  int tagCount;

  tagbubble({
    required this.back,
    required this.text,
    required this.tagName,
    required this.tagCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String countText = tagCount > 0 ? ' $tagCount' : ''; // Add tag count only if it's greater than 0

    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: back,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              '$tagName$countText',
              style: TextStyle(
                color: text,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
