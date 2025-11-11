import 'package:flutter/material.dart';
import 'package:kick_street_flutter/widgets/product_card.dart';
import 'package:kick_street_flutter/widgets/drawer.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String name = "Valerian Hizkia E";
  final String npm = "2406495382";
  final String kelas = "E";

  final List<ItemHomepage> items = [
    ItemHomepage("All Products", Icons.store_mall_directory, 0xFF0096C7),
    ItemHomepage("My Products", Icons.shopping_bag, 0xFF5BB450),
    ItemHomepage("Create Product", Icons.add, 0xFFFF2C2C),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kick Street",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: "NPM", content: npm),
                InfoCard(title: "Name", content: name),
                InfoCard(title: "Class", content: kelas),
              ],
            ),

            const SizedBox(height: 16.0),

            Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),

                    child: Text(
                      "Welcome to Kick Street",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),

                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,

                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      drawer: MenuDrawer(),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

class ItemHomepage {
  final String name;
  final IconData icon;
  final int color;

  ItemHomepage(this.name, this.icon, this.color);
}
