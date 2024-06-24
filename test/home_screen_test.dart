import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_item_tracker/providers/item_provider.dart';
import 'package:my_item_tracker/screens/my_item_list.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Add, Edit, and Remove Items', (WidgetTester tester) async {
    // Build the HomeScreen widget
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => ItemProvider(),
        child: const MaterialApp(
          home: MyItemList(),
        ),
      ),
    );

    // Verify the list is empty
    expect(find.byType(ListTile), findsNothing);

    // Add a new item
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).first, 'Test Item');
    await tester.enterText(find.byType(TextFormField).last, 'Test Description');
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();

    // Verify the item is added
    expect(find.byType(ListTile), findsOneWidget);
    expect(find.text('Test Item'), findsOneWidget);
    expect(find.text('Test Description'), findsOneWidget);

    // Edit the item
    await tester.tap(find.byIcon(Icons.edit));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).first, 'Edited Item');
    await tester.enterText(find.byType(TextFormField).last, 'Edited Description');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    // Verify the item is edited
    expect(find.text('Edited Item'), findsOneWidget);
    expect(find.text('Edited Description'), findsOneWidget);

    // Remove the item
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pumpAndSettle();

    // Verify the list is empty again
    expect(find.byType(ListTile), findsNothing);
  });
}
