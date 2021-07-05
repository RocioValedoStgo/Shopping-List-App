import 'package:flutter/material.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:shopping_list/model/cart_item_model.dart';
import 'package:shopping_list/widgets/add_item_widget.dart';
import 'package:shopping_list/widgets/shopping_list_widget.dart';

class ShoppingCartApp extends StatelessWidget {
  final DevToolsStore<List<CartItem>> store;

  const ShoppingCartApp(this.store, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Compras',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ShoppingCart(store),
    );
  }
}

class ShoppingCart extends StatelessWidget {
  final DevToolsStore<List<CartItem>> store;

  ShoppingCart(this.store, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Compras'),
      ),
      body: const ShoppingList(),
      floatingActionButton: ElevatedButton(
        onPressed: () => _openAddItemDialog(context),
        child: const Icon(Icons.add),
      ),
      endDrawer: Container(
          width: 240.0, color: Colors.white, child: ReduxDevTools(store)),
    );
  }
}

_openAddItemDialog(BuildContext context) {
  showDialog(context: context, builder: (context) => const AddItemDialog());
}
