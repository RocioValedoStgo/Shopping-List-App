import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_list/actions/add_item_action.dart';
import 'package:shopping_list/model/cart_item_model.dart';
import 'package:shopping_list/widgets/add_item_dialog_widget.dart';

class AddItemDialog extends StatelessWidget {
  const AddItemDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CartItem>, OnAddCallback>(converter: (store) {
      return (itemName) =>
          store.dispatch(AddItemAction(CartItem(itemName, false)));
    }, builder: (context, callback) {
      return AddItemDialogWidget(callback);
    });
  }
}

typedef OnAddCallback = Function(String itemName);
