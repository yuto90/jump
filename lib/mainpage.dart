import 'package:flutter/material.dart';
import 'dart:async';
import 'background.dart';
import 'ahiru.dart';

import 'cloud.dart';
import 'building.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  static double ahiruYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = ahiruYaxis;
  bool gameHasStarted = false;

  // 雲
  static double cloudOne = 3.5;
  static double cloudTwo = cloudOne + 3.5;
  double cloudThree = cloudTwo + 3.5;
  // 建物
  static double buildingOne = -0.6;
  static double buildingTwo = buildingOne + 0.65;
  double buildingThree = buildingTwo + 0.65;

  void move() {
    initialHeight = ahiruYaxis;
    setState(() {
      time = 0;
      initialHeight = ahiruYaxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.03;
      height = -4.9 * time * time + 0.3 + time;
      setState(() {
        ahiruYaxis = initialHeight - height;
      });
      // 雲 -----------------------------------------------
      setState(() {
        // 画面外に出たら
        if (cloudOne < -8) {
          cloudOne += 16.0;
        } else {
          cloudOne -= 0.08;
        }
      });

      setState(() {
        if (cloudTwo < -5) {
          cloudTwo += 10.0;
        } else {
          cloudTwo -= 0.1;
        }
      });

      setState(() {
        if (cloudThree < -4) {
          cloudThree += 10.0;
        } else {
          cloudThree -= 0.15;
        }
      });

      // 建物 --------------------------------------------------
      setState(() {
        if (buildingOne < -3) {
          buildingOne += 4.5;
        } else {
          buildingOne -= 0.1;
        }
      });

      setState(() {
        if (buildingTwo < -3) {
          buildingTwo += 6.0;
        } else {
          buildingTwo -= 0.1;
        }
      });

      setState(() {
        if (buildingThree < -3) {
          buildingThree += 7.5;
        } else {
          buildingThree -= 0.1;
        }
      });

      if (ahiruYaxis > 1.1) {
        timer.cancel();
        gameHasStarted = false;
      }
    });

    void reStart() {}
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gameHasStarted) {
          move();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  BackGround(
                    heightSize: 290.0,
                    widthSize: 100.0,
                  ),

                  AnimatedContainer(
                    // アヒルの初期位置
                    alignment: Alignment(0, ahiruYaxis),
                    duration: Duration(milliseconds: 0),
                    color: Colors.blue,
                    child: MyAhiru(),
                  ),
                  // ! ビル１ 高い
                  AnimatedContainer(
                    alignment: Alignment(buildingOne, 1.1),
                    duration: Duration(microseconds: 0),
                    child: Building(
                      heightSize: 290.0,
                      widthSize: 100.0,
                    ),
                  ),
                  // * 雲１ 高い
                  AnimatedContainer(
                    alignment: Alignment(cloudOne, -0.9),
                    duration: Duration(microseconds: 0),
                    child: Cloud(
                      heightSize: 100.0,
                      widthSize: 300.0,
                    ),
                  ),
                  // ! ビル2 中間
                  AnimatedContainer(
                    alignment: Alignment(buildingTwo, 1.1),
                    duration: Duration(microseconds: 0),
                    child: Building(
                      heightSize: 250.0,
                      widthSize: 100.0,
                    ),
                  ),
                  // * 雲2 中間
                  AnimatedContainer(
                    alignment: Alignment(cloudTwo, -0.7),
                    duration: Duration(microseconds: 0),
                    child: Cloud(
                      heightSize: 100.0,
                      widthSize: 250.0,
                    ),
                  ),
                  // ! ビル3 低い
                  AnimatedContainer(
                    alignment: Alignment(buildingThree, 1.1),
                    duration: Duration(microseconds: 0),
                    child: Building(
                      heightSize: 200.0,
                      widthSize: 100.0,
                    ),
                  ),
                  // * 雲3 低い
                  AnimatedContainer(
                    alignment: Alignment(cloudThree, -0.5),
                    duration: Duration(microseconds: 0),
                    child: Cloud(
                      heightSize: 100.0,
                      widthSize: 200.0,
                    ),
                  ),
                  Container(
                    alignment: Alignment(0, -0.2),
                    child: gameHasStarted
                        ? Text('')
                        : Text(
                            'T A P  T O  P L A Y',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SCORE',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '0',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'BEST',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '0',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
