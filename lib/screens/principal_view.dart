import 'package:flutter/material.dart';
import 'package:to_do_list/models/menu.dart';
import 'package:to_do_list/screens/calculator.dart';
import 'package:to_do_list/screens/home.dart';
import 'package:to_do_list/screens/listview.dart';

import 'calendar.dart';

class AppHome extends StatefulWidget {
  final void Function(bool value) onChangeTheme;
  final bool isLightTheme;

  const AppHome({
    Key? key,
    required this.isLightTheme,
    required this.onChangeTheme,
  }) : super(key: key);

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int _selectedItem = 0;
  final _pages = [ const HomePage(),const Listview(), Calculator(), const Calendar()];
  final _pageCtrl = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Notes!'),
        leading: Builder(
          builder: (BuildContext context) {
            return Menu(
              isLightTheme: widget.isLightTheme,
              onChangeTheme: (value) {
                widget.onChangeTheme(value);
              },
            );
          },
        ),
      ),
      body: PageView(
        children: _pages,
        onPageChanged: (index){
          setState(() {
            _selectedItem = index;
          });
        },
        controller: _pageCtrl,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).splashColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined), label: 'Listview'),
          BottomNavigationBarItem(icon: Icon(Icons.calculate_outlined), label: 'Calculadora'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined), label: 'Calendário'),
        ],
        currentIndex: _selectedItem,
        onTap: (index){
          _selectedItem = index;
          _pageCtrl.animateToPage(_selectedItem, duration: const Duration(milliseconds: 200), curve: Curves.linear);
        },
      ),
    );
  }
}
