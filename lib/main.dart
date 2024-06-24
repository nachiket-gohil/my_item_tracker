import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/item_provider.dart';
import 'screens/my_item_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemProvider(),
      child: MaterialApp(
        title: 'Item Tracker',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const MyItemList(),
      ),
    );
  }
}
