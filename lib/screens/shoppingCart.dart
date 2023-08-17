import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_app/constant.dart';
import 'package:market_app/provider/cartItem.dart';
import 'package:market_app/screens/PaymentScreen.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<CartItems>(builder: (context, item, child) {
      return Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.08,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cart'.toUpperCase(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        item.cartList.isEmpty
            ? Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Icon(
                      Icons.remove_shopping_cart_outlined,
                      size: 100,
                    )),
                    Center(
                        child: Text(
                      "No Items in the Cart",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ))
                  ],
                ),
              )
            : Expanded(
                child: ListView.builder(
                    itemCount: item.cartList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: ListTile(
                            isThreeLine: true,
                            leading: Image.asset(
                              item.cartList[index].pImage,
                              fit: BoxFit.fitWidth,
                              scale: 5,
                            ),
                            title: Text(
                              item.cartList[index].pName,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "${item.cartList[index].pPrice}\nx${item.cartList[index].pQuantity}",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                item.removeItem(index);
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
        item.cartList.isNotEmpty
            ? Consumer<CartItems>(builder: (context, item, child) {
                return MaterialButton(
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
                    '${item.totalPrice()}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                );
              })
            : SizedBox(
                height: 30,
              ),
        SizedBox(
          height: 30,
        )
      ]);
    }));
  }
}
