import 'package:flutter/material.dart';

class EpiListPage extends StatefulWidget {
  const EpiListPage({super.key});

  @override
  State<EpiListPage> createState() => _EpiListPageState();
}

class _EpiListPageState extends State<EpiListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Epi List'),
        centerTitle: false,
        actions: [
          Badge(
            label: Text('3'),
            child: IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.dark_mode),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Card.outlined(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        width: 1,
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: InkWell(
                      onTap: () {
                        print('Card $index');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          spacing: 15,
                          children: [
                            Card(
                              child: Image.asset(
                                'assets/imgs/epi.jpeg',
                                width: 70,
                                height: 70,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                spacing: 20,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    DateTime.now()
                                        .add(Duration(days: index * 5))
                                        .toLocal()
                                        .toString()
                                        .split(' ')[0],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: OutlinedButton(
                                      onPressed: () {
                                        print('Button pressed for card $index');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(70, 40),
                                      ),
                                      child: Text(
                                        'solicitar',
                                        
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.construction_sharp),
            label: 'EPIs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_sharp),
            label: 'Documentos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_sharp),
            label: 'Treinamentos',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {} 
      )
    );
  }
}
