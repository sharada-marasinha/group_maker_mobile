import 'package:flutter/material.dart';
import 'package:group_maker/group_maker.dart';

class GroupMaker extends StatelessWidget {
  const GroupMaker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group Maker'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home_page');
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
                child: Icon(
              Icons.favorite,
              size: 48,
            )),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('H o m e'),
              onTap: () {
                Navigator.pushNamed(context, '/home_page');
              },
            ),
           const ListTile(
              leading: Icon(Icons.info),
              title: Text('A b o u t'),
            ),
           const ListTile(
              leading: Icon(Icons.settings),
              title: Text('S e t t i n g s'),
            ),
          ],
        ),
      ),
      body: const MyHomePage(),
    );
  }
}
