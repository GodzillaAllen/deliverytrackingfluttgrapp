import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  final List<String> items;

  const CardList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            title: Text(items[index]),
            subtitle: Text('Description of ${items[index]}'),
            onTap: () {
              // Handle tapping on a card
            },
          ),
        );
      },
    );
  }
}
