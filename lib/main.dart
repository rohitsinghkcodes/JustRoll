import 'package:flutter/material.dart';
import 'functionality.dart';

void main() {
  runApp(justRoll());
}

class justRoll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: Center(
            child: Text('JustRoll'),
          ),
          backgroundColor: Colors.blue,
        ),
        body: rolling(),
      ),
    );
  }
}

Functionality funnct = Functionality();

class rolling extends StatefulWidget {
  @override
  _rollingState createState() => _rollingState();
}

class _rollingState extends State<rolling> {
  int diceface = 0;
  int finalScore = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Visibility(
          visible: !funnct.isTen(),
          child: Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: () {},
              child: Text(
                'Final Score',
                style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              Visibility(
                visible: funnct.isTen(),
                child: Expanded(
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      '$diceface',
                      style: TextStyle(fontSize: 100.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    '$finalScore',
                    style: TextStyle(fontSize: 150.0, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
        Visibility(
          visible: funnct.isTen(),
          child: Expanded(
            flex: 3,
            child: FlatButton(
              onPressed: () {
                setState(() {
                  diceface = funnct.randomGen();
                  finalScore += diceface;
                });
              },
              child: Image.asset('images/dice$diceface.png'),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Visibility(
              visible: !funnct.isTen(),
              child: Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(80, 0, 80, 40),
                  child: FlatButton(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20.0),
                      color: Colors.red,
                      onPressed: () {
                        setState(() {
                          funnct.reset();
                          finalScore = 0;
                          diceface = 0;
                        });
                      },
                      child: Text(
                        'Reset',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
