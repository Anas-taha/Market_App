import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final method = [
  Text('Cash on deliverd'),
  Image.asset(
    'asset/payment/visa.png',
    width: 40,
    height: 40,
    alignment: Alignment.topLeft,
  ),
  Image.asset(
    'asset/payment/mastercard.png',
    width: 40,
    height: 40,
    alignment: Alignment.topLeft,
  ),
  Image.asset(
    'asset/payment/paypal.png',
    width: 40,
    height: 40,
    alignment: Alignment.topLeft,
  ),
];

class PaymentMethod extends ChangeNotifier {
  var _currentMethod = method[0];
  get getLength => method.length;

  get currentMethod => _currentMethod;
  updateMethod(value) {
    if (value != _currentMethod) {
      _currentMethod = value;
      notifyListeners();
    }
  }
}
