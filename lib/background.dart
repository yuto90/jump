import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  final heightSize;
  final widthSize;
  BackGround({this.heightSize, this.widthSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSize,
      width: widthSize,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 10, color: Colors.blueGrey[300]),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
