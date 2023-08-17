import 'package:flutter/material.dart';
import 'package:market_app/provider/PaymentMethod.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '../provider/PaymentMethod.dart';
import 'Home.dart';

class Payment_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.08,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Text(
                        'CheckOut'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: kActiveColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text('Address'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red)),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text('Address'),
                  Row(
                    children: [Icon(Icons.phone_android), Text('phone')],
                  ),
                  Row(
                    children: [Icon(Icons.phone), Text('telephone')],
                  ),
                ],
              ),
            ),
            Text(
              'Add new address',
              style: TextStyle(
                color: Colors.red,
                decoration: TextDecoration.underline,
              ),
              textAlign: TextAlign.right,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text('Payment Method'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red)),
              ),
            ),
            Consumer<PaymentMethod>(builder: (context, methods, child) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    RadioListTile(
                      title: method[0],
                      value: method[0],
                      groupValue: methods.currentMethod,
                      onChanged: (value) {
                        if (value != methods.currentMethod) {
                          methods.updateMethod(value);
                        }
                      },
                    ),
                    RadioListTile(
                      title: method[1],
                      value: method[1],
                      groupValue: methods.currentMethod,
                      onChanged: (value) {
                        if (value != methods.currentMethod) {
                          methods.updateMethod(value);
                        }
                      },
                    ),
                    RadioListTile(
                      title: method[2],
                      value: method[2],
                      groupValue: methods.currentMethod,
                      onChanged: (value) {
                        if (value != methods.currentMethod) {
                          methods.updateMethod(value);
                        }
                      },
                    ),
                    RadioListTile(
                      title: method[3],
                      value: method[3],
                      groupValue: methods.currentMethod,
                      onChanged: (value) {
                        if (value != methods.currentMethod) {
                          methods.updateMethod(value);
                        }
                      },
                    ),
                    (methods.currentMethod == method[1] ||
                            methods.currentMethod == method[2])
                        ? Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent, width: 1.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0)),
                                    ),
                                    hintText: 'Credit card number'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    hintText: 'CVV code',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent, width: 1.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0)),
                                    )),
                              )
                            ],
                          )
                        : methods.currentMethod == method[3]
                            ? TextField(
                                decoration: InputDecoration(
                                    hintText: 'PayPal Email',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent, width: 1.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0)),
                                    )),
                              )
                            : SizedBox(
                                height: 10,
                              ),
                    SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      height: 50,
                      minWidth: 200,
                      color: kActiveColor,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Payment_Screen();
                        }));
                      },
                      child: Text(
                        'Make Order',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Home();
                        }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Text('Continue Shopping'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red)),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
