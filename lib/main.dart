import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team Builder App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isInApp = false;
  List<String> names = [
    'John',
    'Jane',
    'Bob',
    'Alice',
    'Charlie',
    'Eva',
    'David',
    'Emma',
    'Frank',
    'Grace',
    'Grace',
    'Grace',
    'Grace',
    'Grace',
    'Grace',
    'Grace',
    'Grace',
    'Grace',
    'Grace',
    'Grace',
    'Grace',
    'Grace',
    'Grace',
    'Grace',
    'Grace',
    'Grace',
    'Grace',
    'Grace',
    'Grace',
    'Grace',
    'Grace',
    'Grace',
  ];

  List<List<String>> groups = [];

  void buildTeams() {
    names.shuffle();
    int groupSize = 5;

    int numberOfTeams = names.length ~/ groupSize;
    int remainingPlayers = names.length % groupSize;

    groups.clear();

    for (int i = 0; i < numberOfTeams; i++) {
      int endIndex = i * groupSize + groupSize;
      groups.add(names.sublist(i * groupSize, endIndex));
    }

    for (int i = 0; i < remainingPlayers; i++) {
      groups[i].add(names[numberOfTeams * groupSize + i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    buildTeams();

    return isInApp
        ? Scaffold(
            appBar: AppBar(
              title: const Text('Team Builder'),
            ),
            body: ListView.builder(
              itemCount: groups.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('Group ${index + 1}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          groups[index].map((name) => Text(name)).toList(),
                    ),
                  ),
                );
              },
            ),
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 200),
                child: Text(
                  'New Game',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isInApp = true;
                    });
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 30)),
                  child: const Text('Start'),
                ),
              )
            ],
          );
  }
}
