import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemsListController extends ChangeNotifier {
  PageController controller = PageController();

  List<bool> isCatagoryPressed = [true, false, false, false];
  List<bool> isSugarPressed = [true, false, false, false];
  List<bool> isSizePressed = [true, false, false];

  onSizePressed(int size) {
    isSizePressed.fillRange(0, 3, false);
    isSizePressed[size] = true;
    notifyListeners();
  }

  onSugarPressed(int buttNUm) {
    isSugarPressed.fillRange(0, 4, false);
    isSugarPressed[buttNUm] = true;

    notifyListeners();
  }

  onCatagoryPressed(int pageNumber) {
    controller.jumpToPage(pageNumber);
    isCatagoryPressed.fillRange(0, 4, false);
    isCatagoryPressed[pageNumber] = true;

    notifyListeners();
  }
}
