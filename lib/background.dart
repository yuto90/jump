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
        color: Colors.green,
        border: Border.all(width: 10, color: Colors.red),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10,
            height: 100,
          ),
          Column(
            children: [
              SizedBox(
                width: 25,
                height: 25,
              ),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  border: Border.all(width: 4, color: Colors.black),
                ),
              ),
              SizedBox(
                width: 10,
                height: 10,
              ),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  border: Border.all(width: 4, color: Colors.black),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
            height: 100,
          ),
          Column(
            children: [
              SizedBox(
                width: 25,
                height: 25,
              ),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  border: Border.all(width: 4, color: Colors.black),
                ),
              ),
              SizedBox(
                width: 10,
                height: 10,
              ),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  border: Border.all(width: 4, color: Colors.black),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
            height: 100,
          ),
        ],
      ),
    );
  }
}
