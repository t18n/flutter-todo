import 'package:flutter/material.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';

import 'randomWords.dart';

void main() {
  configureApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo | Home',
      theme: ThemeData(
        primaryColor: Colors.amberAccent,
      ),
      home: RandomWords(),
    );
  }
}
