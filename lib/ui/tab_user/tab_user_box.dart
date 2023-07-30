import 'package:flutter/material.dart';
import 'package:flutter_musobaqa/providers/tab_admin_provider.dart';
import 'package:flutter_musobaqa/providers/tab_user_provider.dart';
import 'package:provider/provider.dart';


class TabUserBox extends StatefulWidget {
  const TabUserBox({super.key});

  @override
  State<TabUserBox> createState() => _TabUserBoxState();
}

class _TabUserBoxState extends State<TabUserBox> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TabUserProvider>(context, listen: true);
    return Scaffold(
      body:provider.widget,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.shop_two), label: "Products"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (onTab) {
          provider.getScreen(onTab);
        },
        currentIndex: provider.currentIndex,
      ),
    );
  }
}