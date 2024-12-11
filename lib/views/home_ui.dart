import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_tracking_project/services/provider.dart';
import 'package:money_tracking_project/views/subviews/income_view.dart';
import 'package:money_tracking_project/views/subviews/main_view.dart';
import 'package:money_tracking_project/views/subviews/outcome_view.dart';
import 'package:money_tracking_project/models/user.dart';
import 'package:provider/provider.dart';

class HomeUI extends StatefulWidget {
  final User user; // เ
  HomeUI({Key? key, required this.user}) : super(key: key);

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _selectedIndex = 1;

  List<Widget> get _showView => [
        IncomeView(user: widget.user),
        MainView(user: widget.user),
        OutcomeView(user: widget.user),
      ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BalanceProvider(),
      child: Scaffold(
        body: _showView[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(left: 50),
                child: Icon(Icons.attach_money),
              ),
              label: 'Income',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 50),
              label: 'Main',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(right: 50),
                child: Icon(Icons.money_off),
              ),
              label: 'Outcome',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(size: 40),
          unselectedIconTheme: const IconThemeData(size: 35),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: const Color.fromARGB(255, 6, 157, 124),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: (paramValue) {
            setState(() {
              _selectedIndex = paramValue;
            });
          },
        ),
      ),
    );
  }
}
