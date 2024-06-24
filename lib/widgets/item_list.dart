import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';
import '../providers/item_provider.dart';
import '../screens/add_edit_item_screen.dart';

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemProvider>(
      builder: (context, itemProvider, child) {
        return ListView.builder(
          itemCount: itemProvider.items.length,
          itemBuilder: (context, index) {
            final item = itemProvider.items[index];
            return ItemTile(
              item: item,
              index: index,
            );
          },
        );
      },
    );
  }
}

class ItemTile extends StatelessWidget {
  final Item item;
  final int index;

  ItemTile({
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        late RenderBox renderBox;
        late dynamic size, position;
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          renderBox = context.findRenderObject() as RenderBox;
          size = renderBox.size;
          position = renderBox.localToGlobal(Offset.zero);

          print('Item: ${item.name}, Size: $size, Position: $position');
        });

        return ListTile(
          title: Text(item.name),
          subtitle: Text(item.description),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddEditItemScreen(
                      item: item,
                      index: index,
                    ),
                  ));
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  Provider.of<ItemProvider>(
                    context,
                    listen: false,
                  ).removeItem(index);
                },
              ),
              IconButton(
                icon: const Icon(Icons.list_alt),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "RenderBox Info-->\n"
                        "Size: $size, Position: $position"
                        "\n------",
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
