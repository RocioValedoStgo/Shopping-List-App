import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_list/model/cart_item_model.dart';
import 'package:shopping_list/widgets/shopping_list_item_widget.dart';

class ShoppingList extends StatelessWidget {
  const ShoppingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CartItem>, List<CartItem>>(
      converter: (store) => store.state,
      builder: (context, list) {
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, position) => ShoppingListItem(list[position]),
        );
      },
    );
  }
}
