import 'package:flutter/cupertino.dart';
import 'package:market_app/models/Items.dart';

class CartItems with ChangeNotifier {
  List<Items> cartList = [];
  get getCartList {
    return cartList;
  }

  addItem(item) {
    cartList.add(item);
    notifyListeners();
  }

  removeItem(itemIndex) {
    cartList.removeAt(itemIndex);
    notifyListeners();
  }

  totalPrice() {
    int price = 0;
    for (var item in cartList) {
      price += (item.pPrice * (item.pQuantity as int));
    }
    notifyListeners();
    return price;
  }
}
