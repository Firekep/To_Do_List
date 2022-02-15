import 'package:flutter/material.dart';
import 'package:to_do_list/screens/calculator/calculator.dart';
import 'package:to_do_list/screens/home/home.dart';
import '../calendar/calendar.dart';
import '../list_screen/listview.dart';
import '../opitions_screen.dart';

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
  int _selectedItem = 2;
  List<Widget> _pages = [];
  PageController _pageCtrl = PageController();

  @override
  void didChangeDependencies() {
    _pageCtrl = PageController(initialPage: 2);
    setState(() {
      _pages = [
        Calculator(),
        const Listview(),
        const HomePage(),
        const Calendar(),
        OpitionsPage(
          isLightTheme: widget.isLightTheme,
          onChangeTheme: (value) {
            widget.onChangeTheme(value);
          },
        ),
      ];
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Notes!'),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _selectedItem = index;
          });
        },
        controller: _pageCtrl,
      ),
      bottomNavigationBar: bottomBar(context),
    );
  }

  BottomNavigationBar bottomBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined), label: 'Calculadora'),
        BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined), label: 'Listview'),
        BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.tealAccent,), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined), label: 'Calendário'),
        BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_rounded), label: 'Opções'),
      ],
      backgroundColor: Theme.of(context).shadowColor,
      unselectedItemColor: Colors.white,
      selectedItemColor: Theme.of(context).splashColor,
      currentIndex: _selectedItem,
      onTap: (index) {
        _selectedItem = index;
        _pageCtrl.animateToPage(_selectedItem,
            duration: const Duration(milliseconds: 200), curve: Curves.linear);
      },
    );
  }
}
