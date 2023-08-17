import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:market_app/models/Items.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class TeaData extends ChangeNotifier {
  List<Items> _teaItems = [];

  Future<List<Items>> getTeaData() async {
    List<Items> items = [];

    try {
      var collection = await FirebaseFirestore.instance
          .collection('Items')
          .doc('tsDGN2M7dDysC5bHXQMh')
          .collection(kTea)
          .get();
      Iterable<QueryDocumentSnapshot<Map<String, dynamic>>> querySnapShot =
          collection.docs;
      for (final element in querySnapShot.toList()) {
        Map<String, dynamic> data = element.data();

        _teaItems.add(Items(
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

  UnmodifiableListView<Items>? get items {
    UnmodifiableListView<Items> unmodifiableListView =
        UnmodifiableListView(_teaItems);
    notifyListeners();
    return unmodifiableListView;
  }

  get getItemsLength {
    return _teaItems.length;
  }

  addItem(Items items) {
    _teaItems.add(items);
    notifyListeners();
  }

  deleteProduct(Items items) {
    _teaItems.remove(items);
    notifyListeners();
  }
}
