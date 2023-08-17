import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_app/Widgets/Items_ListController.dart';
import 'package:market_app/itemsData/CoffeeData.dart';
import 'package:market_app/itemsData/IceCreamData.dart';
import 'package:market_app/itemsData/JuiceData.dart';
import 'package:market_app/itemsData/teaData.dart';
import 'package:market_app/models/Items.dart';
import 'package:market_app/provider/cartItem.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class ItemsInfo extends StatelessWidget {
  final item;

  ItemsInfo(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Positioned(
            child: Image.asset(item.pImage,
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                fit: BoxFit.contain),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35 - 40,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 40, 15, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.pName,
                            textAlign: TextAlign.start,
                            style: kTextStyle,
                          ),
                          Text("\$ ${item.pPrice}",
                              textAlign: TextAlign.end, style: kTextStyle)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                      child: Text(
                        'Choose size',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey.shade600),
                      ),
                    ),
                    Consumer<ItemsListController>(
                        builder: (context, controllerObject, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Expanded(
                              child: MaterialButton(
                                elevation: 15,
                                color: controllerObject.isSizePressed[0]
                                    ? kActiveColor
                                    : kUnactiveColor,
                                height: 70,
                                onPressed: () {
                                  controllerObject.onSizePressed(0);
                                },
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Large",
                                          style: kTextStyle.copyWith(
                                              color: Colors.grey.shade700)),
                                    ),
                                    Text(
                                      '350ml',
                                      style: TextStyle(
                                          color: Colors.grey.shade500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Expanded(
                              child: MaterialButton(
                                elevation: 15,
                                color: controllerObject.isSizePressed[1]
                                    ? kActiveColor
                                    : kUnactiveColor,
                                height: 70,
                                onPressed: () {
                                  controllerObject.onSizePressed(1);
                                },
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Medium",
                                          style: kTextStyle.copyWith(
                                              color: Colors.grey.shade700)),
                                    ),
                                    Text(
                                      '250ml',
                                      style: TextStyle(
                                          color: Colors.grey.shade500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Expanded(
                              child: MaterialButton(
                                elevation: 15,
                                color: controllerObject.isSizePressed[2]
                                    ? kActiveColor
                                    : kUnactiveColor,
                                height: 70,
                                onPressed: () {
                                  controllerObject.onSizePressed(2);
                                },
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Small",
                                        style: kTextStyle.copyWith(
                                            color: Colors.grey.shade700),
                                      ),
                                    ),
                                    Text(
                                      '125ml',
                                      style: TextStyle(
                                          color: Colors.grey.shade500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 10, 10),
                      child: Text(
                        'Sugar Level',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey.shade600),
                      ),
                    ),
                    Consumer<ItemsListController>(
                        builder: (context, controllerObject, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: MaterialButton(
                              height: 50,
                              elevation: 15,
                              color: controllerObject.isSugarPressed[0]
                                  ? kActiveColor
                                  : kUnactiveColor,
                              onPressed: () {
                                controllerObject.onSugarPressed(0);
                              },
                              child: Column(
                                children: [
                                  Text("0%",
                                      style: kTextStyle.copyWith(
                                          color: Colors.grey.shade700)),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: MaterialButton(
                              height: 50,
                              elevation: 15,
                              color: controllerObject.isSugarPressed[1]
                                  ? kActiveColor
                                  : kUnactiveColor,
                              onPressed: () {
                                controllerObject.onSugarPressed(1);
                              },
                              child: Column(
                                children: [
                                  Text("25%",
                                      style: kTextStyle.copyWith(
                                          color: Colors.grey.shade700)),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: MaterialButton(
                              height: 50,
                              elevation: 15,
                              color: controllerObject.isSugarPressed[2]
                                  ? kActiveColor
                                  : kUnactiveColor,
                              onPressed: () {
                                controllerObject.onSugarPressed(2);
                              },
                              child: Column(
                                children: [
                                  Text("50%",
                                      style: kTextStyle.copyWith(
                                          color: Colors.grey.shade700)),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: MaterialButton(
                              height: 50,
                              elevation: 15,
                              color: controllerObject.isSugarPressed[3]
                                  ? kActiveColor
                                  : kUnactiveColor,
                              onPressed: () {
                                controllerObject.onSugarPressed(3);
                              },
                              child: Column(
                                children: [
                                  Text(
                                    "100%",
                                    style: kTextStyle.copyWith(
                                        color: Colors.grey.shade700),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        QuantityRow(item: item),
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Consumer<CartItems>(
                              builder: (context, cart, child) {
                            return MaterialButton(
                                height: 52,
                                color: kActiveColor,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
                                  child: Text(
                                    'Add to Cart',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                onPressed: () {
                                  cart.addItem(item);
                                  print(cart.cartList);
                                });
                          }),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class QuantityRow extends StatefulWidget {
  const QuantityRow({
    Key? key,
    required this.item,
  }) : super(key: key);

  final item;

  @override
  State<QuantityRow> createState() => _QuantityRowState();
}

class _QuantityRowState extends State<QuantityRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kActiveColor),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Row(
            children: [
              GestureDetector(
                child: Icon(Icons.add),
                onTap: () {
                  widget.item.pQuantity += 1;
                  setState(() {});
                },
              ),
              Text(
                '      ${widget.item.pQuantity}      ',
                style: TextStyle(fontSize: 20),
              ),
              GestureDetector(
                child: Icon(Icons.remove),
                onTap: () {
                  if (widget.item.pQuantity > 1) {
                    widget.item.pQuantity -= 1;
                  }
                  setState(() {});
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
