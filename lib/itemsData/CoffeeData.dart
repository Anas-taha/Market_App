import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:market_app/models/Items.dart';

import '../constant.dart';

class CoffeeData extends ChangeNotifier {
  Future<List<Items>> getCoffeeData() async {
    List<Items> items = [];

    try {
      var collection = await FirebaseFirestore.instance
          .collection('Items')
          .doc('tsDGN2M7dDysC5bHXQMh')
          .collection(kCoffee)
          .get();
      var querySnapShot = collection.docs;
      for (final element in querySnapShot.toList()) {
        Map<String, dynamic> data = element.data();

        _CoffeeItems.add(Items(
            pName: data['name'],
            pDescription: data['descr'],
            pImage: data['image'],
            pPrice: data['price']));
      }
    } on Exception catch (e) {
      print(e);
    }
    notifyListeners();

    return items;
  }

  List<Items> _CoffeeItems = [];

  UnmodifiableListView<Items>? get items {
    UnmodifiableListView<Items> unmodifiableListView =
        UnmodifiableListView(_CoffeeItems);
    notifyListeners();
    return unmodifiableListView;
  }

  get getItemsLength {
    return _CoffeeItems.length;
  }

  addItem(Items items) {
    _CoffeeItems.add(items);
    notifyListeners();
  }

  deleteProduct(Items items) {
    _CoffeeItems.remove(items);
    notifyListeners();
  }
}
