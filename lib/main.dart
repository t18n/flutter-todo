import 'config/configure_nonweb.dart'
    if (dart.library.html) 'config/configure_web.dart';

import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/home.dart';

void main() {
  configureApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo | Home',
      theme: ThemeData(primaryColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
