import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stackapp/models/list_model.dart';
import 'package:stackapp/screens/home_screen.dart';
import 'package:stackapp/screens/search_screen.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentSelect = 0;

  void _menuSelect(int index) {
    setState(() {
          _currentSelect = index;
        });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _screen = [
      HomeScreen(listData: homeData),
      SearchScreen(searchDetail: homeData,)
    ];
    return Scaffold(
      body: _screen[_currentSelect],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFF262432),
          textTheme: Theme.of(context).textTheme.copyWith(caption: TextStyle(color: Color(0xFF4b485b)))
        ),
        child: BottomNavigationBar(
          currentIndex: _currentSelect,
          fixedColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          onTap: _menuSelect,
          items: [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.home),
              title: Text("")
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.search),
              title: Text("")
            )
          ],
        ),
      ),
    );
  }
}