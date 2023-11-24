import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
  ];

  List<List<String>> groups = [];

  final TextEditingController nameController = TextEditingController();

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

    if (remainingPlayers > 0 && remainingPlayers <= 3) {
      for (int i = 0; i < remainingPlayers; i++) {
        groups[i].add(names[numberOfTeams * groupSize + i]);
      }
    } else if (remainingPlayers > 3) {
      int remainingCount = remainingPlayers;
      for (int i = 0; i < numberOfTeams; i++) {
        if (remainingCount > 0) {
          groups[i].add(names[numberOfTeams * groupSize + i]);
          remainingCount--;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: Colors.blue[700],
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'Group Count : ${groups.length} | Student Count ${names.length}',
                      style: const TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Enter Name',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String newName = nameController.text.trim();
                if (newName.isNotEmpty && !names.contains(newName)) {
                  setState(() {
                    names.add(newName);
                    nameController.clear();
                    buildTeams();
                  });
                }
              },
              child: const Text('Add Name'),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: groups.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        'Group ${index + 1}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            groups[index].map((name) => Text(name)).toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
