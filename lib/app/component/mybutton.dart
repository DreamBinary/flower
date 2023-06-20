import 'package:flutter/material.dart';

Container myButton(
    double width, double height, String text, Function() onPressed) {
  return Container(
    width: width,
    height: height,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Color(0xffbef7fe), Colors.blue])),
    child: MaterialButton(
      onPressed: onPressed,
      child: Text(text),
    ),
  );
}
