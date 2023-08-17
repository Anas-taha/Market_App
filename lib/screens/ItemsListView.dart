import 'package:flutter/material.dart';
import 'package:market_app/Widgets/Items_ListController.dart';
import 'package:market_app/screens/ItemInfo.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

import '../itemsData/CoffeeData.dart';
import '../itemsData/IceCreamData.dart';
import '../itemsData/JuiceData.dart';
import '../itemsData/teaData.dart';

class ItemsListViews extends StatelessWidget {
  const ItemsListViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemsListController>(builder: (context, object, child) {
      return Center(
        child: Container(
          child: PageView(
            controller: object.controller,
            onPageChanged: object.onCatagoryPressed,
            children: [
              Consumer<CoffeeData>(
                  builder: (BuildContext context, item, Widget? child) {
                if (item.items!.isNotEmpty) {
                  return ListView.builder(
                      itemCount: item.getItemsLength,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ItemsInfo(item.items![index])));
                          },
                          child: ListTile(
                            isThreeLine: true,
                            leading: Image.asset(
                              item.items![index].pImage,
                              fit: BoxFit.fitWidth,
                              scale: 5,
                            ),
                            title: Text(
                              item.items![index].pName,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                                "${item.items![index].pDescription}\n ${item.items![index].pPrice} \$"),
                            trailing: InkWell(
                              child: Icon(
                                Icons.add_circle,
                                color: kActiveColor,
                              ),
                            ),
                          ),
                        );
                      });
                } else {
                  return Text('loading...');
                }
              }),
              Consumer<TeaData>(
                  builder: (BuildContext context, item, Widget? child) {
                if (item.items!.isNotEmpty) {
                  return ListView.builder(
                      itemCount: item.getItemsLength,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ItemsInfo(item.items![index])));
                          },
                          child: ListTile(
                            isThreeLine: true,
                            leading: Image.asset(
                              item.items![index].pImage,
                              scale: 5,
                            ),
                            title: Text(
                              item.items![index].pName,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                                "${item.items![index].pDescription}\n ${item.items![index].pPrice} \$"),
                            trailing: InkWell(
                              child: Icon(
                                Icons.add_circle,
                                color: kActiveColor,
                              ),
                            ),
                          ),
                        );
                      });
                } else {
                  return Text('loading...');
                }
              }),
              Consumer<JuiceData>(
                  builder: (BuildContext context, item, Widget? child) {
                if (item.items!.isNotEmpty) {
                  return ListView.builder(
                      itemCount: item.getItemsLength,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ItemsInfo(item.items![index])));
                          },
                          child: ListTile(
                            isThreeLine: true,
                            leading: Image.asset(
                              item.items![index].pImage,
                              scale: 5,
                            ),
                            title: Text(
                              item.items![index].pName,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                                "${item.items![index].pDescription}\n ${item.items![index].pPrice} \$"),
                            trailing: InkWell(
                              child: Icon(
                                Icons.add_circle,
                                color: kActiveColor,
                              ),
                            ),
                          ),
                        );
                      });
                } else {
                  return Text('loading...');
                }
              }),
              Consumer<IceCreamData>(
                  builder: (BuildContext context, item, Widget? child) {
                if (item.items!.isNotEmpty) {
                  return ListView.builder(
                      itemCount: item.getItemsLength,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ItemsInfo(item.items![index])));
                          },
                          child: ListTile(
                            isThreeLine: true,
                            leading: Image.asset(
                              item.items![index].pImage,
                              scale: 5,
                            ),
                            title: Text(
                              item.items![index].pName,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                                "${item.items![index].pDescription}\n ${item.items![index].pPrice} \$"),
                            trailing: InkWell(
                              child: Icon(
                                Icons.add_circle,
                                color: kActiveColor,
                              ),
                            ),
                          ),
                        );
                      });
                } else {
                  return Text('loading...');
                }
              })
            ],
          ),
        ),
      );
    });
  }
}
