import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:market_app/Widgets/Items_ListController.dart';
import 'package:market_app/constant.dart';
import 'package:market_app/provider/cartItem.dart';
import 'package:market_app/screens/shoppingCart.dart';
import 'package:provider/provider.dart';
import 'ItemsListView.dart';
import 'package:badges/badges.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.08,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'fresh'.toUpperCase(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CartPage()));
                    }, child:
                        Consumer<CartItems>(builder: (context, number, child) {
                      return Badge(
                          badgeColor: kActiveColor,
                          badgeContent: Text('${number.cartList.length}'),
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            size: 30,
                          ));
                    }))
                  ],
                ),
              ),
            ),
            Container(
              child: ImageSlideshow(
                height: MediaQuery.of(context).size.height * 0.20,
                initialPage: 0,
                indicatorColor: Colors.blue,
                indicatorBackgroundColor: Colors.grey,
                isLoop: true,
                children: [
                  Image.asset(
                    'asset/images2.jpg',
                    fit: BoxFit.fill,
                  ),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      'asset/images3.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      'asset/images4.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Consumer<ItemsListController>(
              builder: (context, itemlist, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<ItemsListController>(
                        builder: (context, getcatagory, child) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: MaterialButton(
                          elevation: 15,
                          color: getcatagory.isCatagoryPressed[0]
                              ? kActiveColor
                              : kUnactiveColor,
                          height: 100,
                          onPressed: () {
                            getcatagory.onCatagoryPressed(0);
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'asset/coffee-cup.png',
                                scale: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Coffee"),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                    Consumer<ItemsListController>(
                        builder: (context, getcatagory, child) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.20,
                        child: MaterialButton(
                          elevation: 15,
                          color: getcatagory.isCatagoryPressed[1]
                              ? kActiveColor
                              : kUnactiveColor,
                          height: 100,
                          onPressed: () {
                            getcatagory.onCatagoryPressed(1);
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'asset/tea-cup.png',
                                scale: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Tea"),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                    Consumer<ItemsListController>(
                        builder: (context, getcatagory, child) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.20,
                        child: MaterialButton(
                          elevation: 15,
                          color: getcatagory.isCatagoryPressed[2]
                              ? kActiveColor
                              : kUnactiveColor,
                          height: 100,
                          onPressed: () {
                            getcatagory.onCatagoryPressed(2);
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'asset/orange-juice.png',
                                scale: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Juice"),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                    Consumer<ItemsListController>(
                        builder: (context, getcatagory, child) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.22,
                        child: MaterialButton(
                          elevation: 15,
                          color: getcatagory.isCatagoryPressed[3]
                              ? kActiveColor
                              : kUnactiveColor,
                          height: 100,
                          onPressed: () {
                            getcatagory.onCatagoryPressed(3);
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'asset/ice-cream.png',
                                scale: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Cream"),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(child: ItemsListViews()),
          ],
        ),
      ),
    );
  }
}
