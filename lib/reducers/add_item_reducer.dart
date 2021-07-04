import 'package:shopping_list/actions/add_item_action.dart';
import 'package:shopping_list/model/cart_item_model.dart';

List<CartItem> addItem(List<CartItem> items, AddItemAction action) {
  return List.from(items)..add(action.item);
}
