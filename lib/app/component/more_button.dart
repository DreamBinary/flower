import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final VoidCallback? onPressed;

  const MoreButton(
      {super.key,
      this.text = "更多",
      this.size = 24,
      this.color = Colors.black,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: const StadiumBorder(),
      child: Row(
        children: [
          Text(text, style: TextStyle(fontSize: size, color: color)),
          Icon(Icons.arrow_forward_ios_rounded, size: size, color: color)
        ],
      ),
    );
  }
}
