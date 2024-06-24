import 'package:flutter_test/flutter_test.dart';
import 'package:item_tracker/models/item.dart';
import 'package:item_tracker/providers/item_provider.dart';

void main() {
  group('ItemProvider Tests', () {
    test('Add Item', () {
      final itemProvider = ItemProvider();
      final item = Item(name: 'Test Item', description: 'Test Description');

      itemProvider.addItem(item);

      expect(itemProvider.items.length, 1);
      expect(itemProvider.items[0].name, 'Test Item');
    });

    test('Edit Item', () {
      final itemProvider = ItemProvider();
      final item = Item(name: 'Test Item', description: 'Test Description');

      itemProvider.addItem(item);
      final newItem = Item(name: 'New Name', description: 'New Description');
      itemProvider.editItem(0, newItem);

      expect(itemProvider.items[0].name, 'New Name');
      expect(itemProvider.items[0].description, 'New Description');
    });

    test('Remove Item', () {
      final itemProvider = ItemProvider();
      final item = Item(name: 'Test Item', description: 'Test Description');

      itemProvider.addItem(item);
      itemProvider.removeItem(0);

      expect(itemProvider.items.isEmpty, true);
    });

    test('Item List is initially empty', () {
      final itemProvider = ItemProvider();

      expect(itemProvider.items.isEmpty, true);
    });
  });
}
