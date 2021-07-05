import 'package:flutter/material.dart';

class AddItemDialogWidget extends StatefulWidget {
  final OnAddCallback callback;

  const AddItemDialogWidget(this.callback, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddItemDialogWidgetState(callback);
}

class _AddItemDialogWidgetState extends State<AddItemDialogWidget> {
  String itemName = '';
  final OnAddCallback callback;

  _AddItemDialogWidgetState(this.callback);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(16.0),
      content: Row(
        children: <Widget>[
          Expanded(
              child: TextField(
            autofocus: true,
            decoration: const InputDecoration(
                labelText: 'Nombre', hintText: 'eg. Manzana Roja'),
            onChanged: _handleTextChanged,
          ))
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.pop(context);
            }),
        ElevatedButton(
            child: const Text('Agregar'),
            onPressed: () {
              Navigator.pop(context);
              callback(itemName);
            })
      ],
    );
  }

  _handleTextChanged(String newItemName) {
    setState(() {
      itemName = newItemName;
    });
  }
}

typedef OnAddCallback = Function(String itemName);
