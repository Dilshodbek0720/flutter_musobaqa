import 'package:flutter/material.dart';
import 'package:flutter_musobaqa/providers/tab_provider.dart';
import 'package:provider/provider.dart';


class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TabProvider>(context, listen: true);
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