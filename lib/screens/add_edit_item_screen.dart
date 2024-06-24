import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';
import '../providers/item_provider.dart';

class AddEditItemScreen extends StatefulWidget {
  final Item? item;
  final int? index;

  const AddEditItemScreen({
    super.key,
    this.item,
    this.index,
  });

  @override
  _AddEditItemScreenState createState() => _AddEditItemScreenState();
}

class _AddEditItemScreenState extends State<AddEditItemScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _description;

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      _name = widget.item!.name;
      _description = widget.item!.description;
    } else {
      _name = '';
      _description = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        elevation: 6,
        shadowColor: Colors.grey[100],
        toolbarHeight: 70,
        title: Text(
          widget.item == null ? 'Add Item' : 'Edit Item',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                onSaved: (value) => _name = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _description,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
                onSaved: (value) => _description = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final item = Item(name: _name, description: _description);
                    if (widget.item == null) {
                      Provider.of<ItemProvider>(
                        context,
                        listen: false,
                      ).addItem(item);
                    } else {
                      Provider.of<ItemProvider>(
                        context,
                        listen: false,
                      ).editItem(widget.index!, item);
                    }
                    Navigator.of(context).pop();
                  }
                },
                child: Text(
                  widget.item == null ? 'Add' : 'Save',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
