import 'dart:math';
import 'package:flutter/material.dart';

import 'alert_box.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 10;
  int _min = 0;
  int _max = 15;
  int indexColor = 0;
  Random random = Random();
  List<Color> colors = [
    Colors.blue.shade500,
    Colors.brown.shade100,
    Colors.cyan.shade200,
    Colors.green.shade400,
    Colors.indigoAccent.shade400,
    Colors.orange.shade600,
    Colors.pink.shade100,
    Colors.purple.shade900,
  ];

  oneChangeColor() => setState(() => indexColor = random.nextInt(8));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter increment & decrement'),
        backgroundColor: colors[indexColor],

        //backgroundColor:colors[twoindexColor],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: colors[indexColor].withOpacity(0.3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'min',
                        ),
                        GestureDetector(
                          onTap: () async {
                            var value = await showDialog(
                              context: context,
                              builder: (context) => MyAlertbox(
                                min: _min,
                                isMin: true,
                              ),
                            );
                            if (value != 0) {
                              setState(() {
                                _min = value;
                                if (_counter < _min) {
                                  _counter = _min;
                                }
                              });
                            }
                          },
                          child: Text(
                            '$_min',
                            style: TextStyle(
                                color: colors[indexColor], fontSize: 40),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'max',
                        ),
                        GestureDetector(
                          onTap: () async {
                            var value = await showDialog(
                              context: context,
                              builder: (context) => MyAlertbox(
                                max: _max,
                                isMin: true,
                              ),
                            );
                            if (value != null) {
                              setState(() {
                                _max = value;
                                if (_counter < _max) {
                                  _counter = _max;
                                }
                              });
                            }
                          },
                          child: Text(
                            '$_max',
                            style: TextStyle(
                                color: colors[indexColor], fontSize: 40),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter minimum value",
                // border: InputBorder.none,
              ),
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                print(value);
              },
            ),
            TextField(
              autofocus: true,
              obscureText: true,
              onChanged: (value) => _min,
              decoration: InputDecoration(
                hintText: 'Enter minimum value',
                border: InputBorder.none,
                fillColor: Colors.pink,
                hintStyle: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: TextStyle(color: colors[indexColor], fontSize: 40),
              //twostyle: TextStyle(color: colrs[indexColor], fontSize: 40),
            ),
            Spacer(),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment:CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 10,
            width: 30,
          ),
          FloatingActionButton(
            onPressed: _twoIncrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.last_page),
            backgroundColor: colors[indexColor],
          ),
          SizedBox(
            height: 10,
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: colors[indexColor],
            onPressed: () => _twoDecrementCounter(),
            tooltip: 'Decrement',
            child: Icon(
              Icons.first_page,
            ),
          ),
          SizedBox(
            height: 10,
            width: 70,
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
            backgroundColor: colors[indexColor],
          ),
          SizedBox(
            height: 10,
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: colors[indexColor],
            onPressed: () => _decrementCounter(),
            tooltip: 'Decrement',
            child: Icon(
              Icons.remove,
            ),
          ),
          SizedBox(
            height: 10,
            width: 10,
          ),
        ],
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      if (_counter < _max) {
        _counter++;
        oneChangeColor();
      }
    });
  }

  _decrementCounter() {
    print(_counter);
    setState(() {
      if (_counter > _min) {
        _counter--;
        oneChangeColor();
      }
    });
  }

  void _twoIncrementCounter() {
    setState(() {
      if (_counter + 1 < _max) {
        _counter += 2;
        oneChangeColor();
      }
    });
  }

  _twoDecrementCounter() {
    print(_counter);
    setState(() {
      if (_counter - 1 > _min) {
        _counter -= 2;
        oneChangeColor();
      }
    });
  }
}
