import 'package:flutter/material.dart';
import 'package:group_maker/app.dart';
import 'package:group_maker/group_maker.dart';
import 'package:group_maker/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/home_page': (context) => HomePage(),
        '/group_maker': (context) => GroupMaker(),
      },
    );
  }
}
