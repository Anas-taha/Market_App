import 'package:flutter/material.dart';

const kLoginButtonColor = Colors.lightBlueAccent;
const kActiveColor = Colors.blue;
const kUnactiveColor = Colors.white54;
const kCoffee = 'coffee';
const kJuice = 'juice';
const kIceCream = 'iceCream';
const kTea = 'tea';
const kTextStyle =
    TextStyle(fontSize: 20, color: kActiveColor, fontWeight: FontWeight.bold);

const kTextFieldDecoration = InputDecoration(
  hintText: '',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
