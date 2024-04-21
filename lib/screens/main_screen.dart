import 'package:assessment_application_1/graph/bar_graph.dart';
import 'package:assessment_application_1/screens/graph.dart';
import 'package:assessment_application_1/screens/shared_expense_screen.dart';
import 'package:assessment_application_1/screens/trans_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:icons_flutter/icons_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _selectedPageIndex = 0;
  late Color selectedItem = Colors.blue;
  Color unselectedItem = Colors.grey;
  Widget _activePage = TransScreen();

  @override
  Widget build(BuildContext context) {
    if (_selectedPageIndex == 1) {
      setState(() {
        _activePage = const MyGraph();
      });
    }
    return Scaffold(
      body: _selectedPageIndex == 0 ? TransScreen() : MyGraph(),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                _selectedPageIndex = value;
              });
            },
            // selectedItemColor: Colors.red,
            backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 3,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.home,
                    color:
                        _selectedPageIndex == 0 ? selectedItem : unselectedItem,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.graph_square_fill,
                    color:
                        _selectedPageIndex == 1 ? selectedItem : unselectedItem,
                  ),
                  label: 'Stats'),
            ]),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: (index) {
      //     setState(() {
      //       _selectedPageIndex = index;
      //       _selectedPageIndex == 0
      //           ? _activePage = TransScreen()
      //           : _activePage = const MyGraph();
      //     });
      //   },
      //   currentIndex: _selectedPageIndex,
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(MaterialCommunityIcons.swap_horizontal_bold),
      //         label: 'Personal Expense'),
      //     BottomNavigationBarItem(
      //       icon: Icon(MaterialCommunityIcons.graphql),
      //       label: 'Stats',
      //     ),
      //   ],
      // ),
    );
  }
}
