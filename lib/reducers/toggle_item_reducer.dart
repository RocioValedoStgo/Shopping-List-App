import 'package:shopping_list/actions/toggle_state_action.dart';
import 'package:shopping_list/model/cart_item_model.dart';

List<CartItem> toggleItemState(
    List<CartItem> items, ToggleItemStateAction action) {
  List<CartItem> itemsNew = items
      .map((item) => item.name == action.item.name ? action.item : item)
      .toList();
  return itemsNew;
}
