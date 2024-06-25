import 'package:appmarajoticketsales/page/viangem_screen.dart';
import 'package:flutter/material.dart';
import 'package:appmarajoticketsales/page/festas_screen.dart';
import 'package:appmarajoticketsales/page/lanches_screen.dart';
import 'package:appmarajoticketsales/page/passagens_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    ViagemScreen(), // Tela de Viagens
    PassagensScreen(), // Tela de Passagens
    FestasScreen(), // Tela de Festas
    LanchesScreen(), // Tela de Lanches
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_boat),
            label: 'Viagens',
          ),
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
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Para garantir que todos os ícones e rótulos sejam exibidos
      ),
    );
  }
}
