import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Group Maker')),
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
                Navigator.pop(context);
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
      body: Column(
        children: [
          const Card(
            child: ListTile(
              leading: FlutterLogo(size: 72.0),
              title: Text('Three-line ListTile'),
              subtitle:
                  Text('A sufficiently long subtitle warrants three lines.'),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/group_maker');
              },
              child: Container(
                padding: const EdgeInsets.all(15.0),
                margin: EdgeInsets.all(25),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue, // Adjust the color as needed
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white, // Adjust the color as needed
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
