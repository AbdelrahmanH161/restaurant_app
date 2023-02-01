import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurant_app/widget/CompletedOrder.dart';
import 'package:restaurant_app/widget/NewOrder.dart';
import 'package:restaurant_app/widget/UnderPreparationOrder.dart';
import 'package:restaurant_app/widget/readyOrder.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    NewOrder(),
    UnderPreparationOrder(),
    ReadyOrder(),
    CompletedOrder(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('restaurant')),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.add_business_rounded), label: 'طلبات جديده'),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm_rounded), label: 'تحت التحضير'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: 'جاهز للاستلام'),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'منتهي'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[400],
        unselectedItemColor: Colors.amber[300],
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
