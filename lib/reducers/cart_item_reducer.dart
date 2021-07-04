import 'package:shopping_list/actions/add_item_action.dart';
import 'package:shopping_list/actions/toggle_state_action.dart';
import 'package:shopping_list/model/cart_item_model.dart';
import 'package:shopping_list/reducers/add_item_reducer.dart';
import 'package:shopping_list/reducers/toggle_item_reducer.dart';

List<CartItem> cartItemsReducer(List<CartItem> items, dynamic action) {
  if (action is AddItemAction) {
    return addItem(items, action);
  } else if (action is ToggleItemStateAction) {
    return toggleItemState(items, action);
  }
  return items;
}
