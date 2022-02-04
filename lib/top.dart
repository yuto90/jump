import 'package:flutter/material.dart';
import 'package:jump/mainpage.dart';

class Top extends StatefulWidget {
  const Top({Key key}) : super(key: key);

  @override
  _TopState createState() => _TopState();
}

class _TopState extends State<Top> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'タイトル画面',
                style: TextStyle(fontSize: 40),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(),
                    ),
                  );
                },
                child: Text('スタート'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
