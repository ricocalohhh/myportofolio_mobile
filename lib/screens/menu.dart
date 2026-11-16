import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/project_card.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String npm = '2506539990';
  final String nama = 'Enrico Oscar Harits Caloh';
  final String kelas = 'PBP A';

  final List<ItemHomepage> items = [
    ItemHomepage('Lihat Proyek', Icons.folder_open, Colors.blue.shade800),
    ItemHomepage('Tambah Proyek', Icons.add_circle, Colors.green.shade800),
    ItemHomepage('Logout', Icons.logout, Colors.red.shade800),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MyPortfolio',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: InfoCard(title: 'NPM', content: npm),
                  ),
                  Expanded(
                    child: InfoCard(title: 'Name', content: nama),
                  ),
                  Expanded(
                    child: InfoCard(title: 'Class', content: kelas),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  'Selamat datang di MyPortfolio Mobile!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ),
              GridView.count(
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                mainAxisExtent: 160,
                shrinkWrap: true,
                children: items.map((item) => ItemCard(item)).toList(),
              ),
            ],
          ),
        ),
      ),
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}
