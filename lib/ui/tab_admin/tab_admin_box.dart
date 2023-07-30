import 'package:flutter/material.dart';
import 'package:flutter_musobaqa/providers/tab_admin_provider.dart';
import 'package:provider/provider.dart';


class TabAdminBox extends StatefulWidget {
  const TabAdminBox({super.key});

  @override
  State<TabAdminBox> createState() => _TabAdminBoxState();
}

class _TabAdminBoxState extends State<TabAdminBox> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TabAdminProvider>(context, listen: true);
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