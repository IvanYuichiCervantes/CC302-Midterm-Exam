import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic List with Cards',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Students'),
        ),
        body: ItemList(),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class ItemList extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  
  final List<String> items = [
    "Ivan",
    "Axcel",
    "Efren",
    "Japhet",
    "Evo",
    "Chris",
    "Nikko",
    "Dimple",
    "Joshua",
    "Jacob"
  ];

  
  final Map<String, bool> addedStatus = {};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return CardWidget(
          item: item,
          isAdded: addedStatus[item] ?? false,
          onAdd: () {
            setState(() {
              addedStatus[item] = true; 
            });
          },
          onDetails: () {
            print('Details of $item: This is a Student!');
          },
        );
      },
    );
  }
}

class CardWidget extends StatelessWidget {
  final String item;
  final bool isAdded;
  final VoidCallback onAdd;
  final VoidCallback onDetails;

  const CardWidget({
    required this.item,
    required this.isAdded,
    required this.onAdd,
    required this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Card(
        color: isAdded ? Colors.green[100] : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  item,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: onDetails,
                  child: Text('Details'),
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: isAdded ? null : onAdd,
                  child: Text(isAdded ? 'Added' : 'Add'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isAdded ? Colors.grey : Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
