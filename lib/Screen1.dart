import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:testapp/Page1.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  int _currentIndex = 0;

  List pageList = [
    PageOne(),
    Center(child: Text('data1')),
    Center(child: Text('data2')),
    Center(child: Text('data3')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        //selectedLabelStyle: TextStyle(color: Colors.blue),
        unselectedItemColor: Colors.blueGrey,
        showSelectedLabels: true,
        unselectedLabelStyle: TextStyle(color: Colors.blueGrey),
        selectedIconTheme: IconThemeData(color: Colors.blue),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.calendarCheck,
            ),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.users,
            ),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.scroll,
            ),
            label: 'Enrollments',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.bell,
            ),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}
