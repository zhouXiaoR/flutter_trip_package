import 'package:flutter/material.dart';
import 'package:flutter_trip/pages/home_page.dart';
import 'package:flutter_trip/pages/mine_page.dart';
import 'package:flutter_trip/pages/search_page.dart';
import 'package:flutter_trip/pages/travel_page.dart';

class MainTabbar extends StatefulWidget {
  @override
  _MainTabbarState createState() => _MainTabbarState();
}

class _MainTabbarState extends State<MainTabbar> {
  int _currentIndex = 0;
  final _defaultColor = Colors.grey;
  final _selectedColor = Colors.blue;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TravelPage(),
          MinePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            _pageController.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: _currentIndex == 0 ? _selectedColor : _defaultColor,
                ),
                //activeIcon:,
                title: Text(
                  '首页',
                  style: TextStyle(
                    color: _currentIndex == 0 ? _selectedColor : _defaultColor,
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: _currentIndex == 1 ? _selectedColor : _defaultColor,
                ),
                //activeIcon:,
                title: Text(
                  '搜索',
                  style: TextStyle(
                    color: _currentIndex == 1 ? _selectedColor : _defaultColor,
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.camera_alt,
                  color: _currentIndex == 2 ? _selectedColor : _defaultColor,
                ),
                //activeIcon:,
                title: Text(
                  '旅行',
                  style: TextStyle(
                    color: _currentIndex == 2 ? _selectedColor : _defaultColor,
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: _currentIndex == 3 ? _selectedColor : _defaultColor,
                ),
                //activeIcon:,
                title: Text(
                  '我的',
                  style: TextStyle(
                    color: _currentIndex == 3 ? _selectedColor : _defaultColor,
                  ),
                )),
          ]),
    );
  }
}
