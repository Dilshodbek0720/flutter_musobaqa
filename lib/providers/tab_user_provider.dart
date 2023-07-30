import 'package:flutter/material.dart';
import 'package:flutter_musobaqa/ui/tab_user/products/products.dart';
import 'package:flutter_musobaqa/ui/tab_user/profile/profile_screen.dart';

import '../ui/tab_user/categories/categories_screen.dart';

class TabUserProvider with ChangeNotifier {

  TabUserProvider()  {
    getWidgets();
  }

  int currentIndex = 0;
  List<Widget> screens = [];
  Widget? widget;

  void getWidgets(){
    screens.add(const CategoriesScreen());
    screens.add(const ProductsScreen());
    screens.add(const ProfileScreen());
    widget = screens[0];
    notifyListeners();
  }

  getScreen(int index){
    widget =  screens[index];
    currentIndex = index;
    notifyListeners();
  }

}
