import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:shopping_list/model/cart_item_model.dart';
import 'package:shopping_list/reducers/cart_item_reducer.dart';
import 'package:shopping_list/shopping_cart_app.dart';

void main() {
  final store =
      DevToolsStore<List<CartItem>>(cartItemsReducer, initialState: []);
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final DevToolsStore<List<CartItem>> store;

  const MyApp(this.store, {Key? key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<List<CartItem>>(
        store: store, child: ShoppingCartApp(store));
  }
}
