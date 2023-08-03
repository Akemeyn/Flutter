import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> items = [];
  List<double> prices = [1.00, 2.00, 5.00];
  final textController = TextEditingController();
  int? itemIndex;
  IconData buttonIcon = Icons.add;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
                child: TextField(
              controller: textController,
            )),
            ElevatedButton(
              child: Icon(buttonIcon),
              onPressed: () {
                setState(() {
                  if (itemIndex != null) {
                    items[itemIndex!] = textController.text;
                    itemIndex = null;
                    buttonIcon = Icons.add;
                  } else {
                    items.add(textController.text);
                  }
                  textController.clear();
                });
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(items[index]),
                trailing: const Text('\$-'),
                onTap: () {
                  itemIndex = index;
                  setState(() {
                    textController.text = items[index];
                    buttonIcon = Icons.save;
                  });
                },
                onLongPress: () {
                  setState(() {
                    items.removeAt(index);
                  });
                },
              ),
            );
          }),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home Page'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
