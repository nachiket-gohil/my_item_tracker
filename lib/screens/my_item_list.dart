import 'package:flutter/material.dart';

import '../screens/add_edit_item_screen.dart';
import '../widgets/item_list.dart';

class MyItemList extends StatelessWidget {
  const MyItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        elevation: 6,
        toolbarHeight: 70,
        title: const Text('Item Tracker'),
      ),
      body: ItemList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddEditItemScreen(),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
