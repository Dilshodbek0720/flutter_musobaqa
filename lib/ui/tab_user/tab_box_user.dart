import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_musobaqa/provider/tab_user_provider.dart';
import 'package:provider/provider.dart';

class TabBoxUserScreen extends StatefulWidget {
  const TabBoxUserScreen({super.key});

  @override
  State<TabBoxUserScreen> createState() => _TabBoxUserScreenState();
}

class _TabBoxUserScreenState extends State<TabBoxUserScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TabUserProvider>(context, listen: true);
    return Scaffold(
      body: provider.widget,
      bottomNavigationBar: SizedBox(
        height: 110,
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: const Color(0xFF9B9B9B),
          selectedItemColor:  Colors.blue,
          onTap: (onTab) {
            provider.getScreen(onTab);
          },
          currentIndex: provider.currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category, size: 30), label: "Category"),
            BottomNavigationBarItem(
                icon: Icon(Icons.production_quantity_limits, size: 30), label: "Products"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 30), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
