// pages/home_screen.dart

import 'package:appmarajoticketsales/page/festas_screen.dart';
import 'package:appmarajoticketsales/page/lanches_screen.dart';
import 'package:appmarajoticketsales/page/passagens_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    PassagensScreen(),
    FestasScreen(),
    LanchesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ilha do Marajó'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Ação de notificações
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Ação de perfil
            },
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_boat),
            label: 'Passagens',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.festival),
            label: 'Festas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Lanches',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}