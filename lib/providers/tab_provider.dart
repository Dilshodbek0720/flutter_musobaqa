import 'package:flutter/material.dart';
import 'package:flutter_musobaqa/ui/tab/categories/categories_screen.dart';
import 'package:flutter_musobaqa/ui/tab/products/products.dart';
import 'package:flutter_musobaqa/ui/tab/profile/profile_screen.dart';

class TabProvider with ChangeNotifier {

  TabProvider()  {
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
