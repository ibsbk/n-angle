import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Container(
                    color: Colors.amber,
                    width: 50,
                    height: 50,
                    child: CustomPaint(
                      painter: Painter(_counter),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _counter++;
                      setState(
                        () {},
                      );
                    },
                    child: const Text('++++++'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _counter--;
                      });
                    },
                    child: Text('--------'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Painter extends CustomPainter {
  final int n;

  Painter(this.n);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    Path path = Path();

    double s = size.height / 2;
    double xc = size.width / 2;
    double yc = size.height / 2;

    path.addRect(Rect.fromCenter(center: Offset(s, s), width: 1, height: 1));

    for (var i = 1; i <= n; i += 1) {
      if (i == 1) {
        path.moveTo(xc + s * cos( 2 * pi * i / n), yc + s * sin(2 * pi * i / n));
      }
      path.lineTo(xc + s * cos(2 * pi * i / n), yc + s * sin(2 * pi * i / n));
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
