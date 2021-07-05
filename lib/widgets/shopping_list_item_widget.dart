import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_list/actions/toggle_state_action.dart';
import 'package:shopping_list/model/cart_item_model.dart';

class ShoppingListItem extends StatelessWidget {
  final CartItem item;

  const ShoppingListItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CartItem>, OnStateChanged>(converter: (store) {
      return (item) => store.dispatch(ToggleItemStateAction(item));
    }, builder: (context, callback) {
      return ListTile(
        title: Text(item.name),
        leading: Checkbox(
            value: item.checked,
            onChanged: (newValue) {
              callback(CartItem(item.name, newValue!));
            }),
      );
    });
  }
}

typedef OnStateChanged = Function(CartItem item);
