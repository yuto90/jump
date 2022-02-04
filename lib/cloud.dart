import 'package:flutter/material.dart';

class Cloud extends StatelessWidget {
  final heightSize;
  final widthSize;
  Cloud({this.heightSize, this.widthSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthSize,
      height: heightSize,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 4, color: Colors.blue[200]),
          borderRadius: BorderRadius.circular(60)),
    );
  }
}
