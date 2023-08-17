import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:market_app/models/Items.dart';

import '../constant.dart';

class JuiceData extends ChangeNotifier {
  Future<List<Items>> getJuiceData() async {
    List<Items> items = [];

    try {
      var collection = await FirebaseFirestore.instance
          .collection('Items')
          .doc('tsDGN2M7dDysC5bHXQMh')
          .collection(kJuice)
          .get();
      Iterable<QueryDocumentSnapshot<Map<String, dynamic>>> querySnapShot =
          collection.docs;
      for (final element in querySnapShot.toList()) {
        Map<String, dynamic> data = element.data();

        _juiceItems.add(Items(
            pName: data['name'],
            pDescription: data['descr'],
            pImage: data['image'],
            pPrice: data['price']));
      }
    } on Exception catch (e) {
      print(e);
      // TODO
    }
    notifyListeners();
    return items;
  }

  List<Items> _juiceItems = [];

  UnmodifiableListView<Items>? get items {
    UnmodifiableListView<Items> unmodifiableListView =
        UnmodifiableListView(_juiceItems);
    notifyListeners();
    return unmodifiableListView;
  }

  get getItemsLength {
    return _juiceItems.length;
  }

  addItem(Items items) {
    _juiceItems.add(items);
    notifyListeners();
  }

  deleteProduct(Items items) {
    _juiceItems.remove(items);
    notifyListeners();
  }
}
