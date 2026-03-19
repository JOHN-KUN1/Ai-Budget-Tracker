import 'package:budget_tracker/screens/dashboard_screen.dart';
import 'package:budget_tracker/screens/settings_screen.dart';
import 'package:budget_tracker/screens/transactions_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenIndex == 0 ? TransactionsScreen() : _screenIndex == 1 ? DashboardScreen() : SettingsScreen(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _screenIndex = 0;
                });
              },
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(
                    size: 30,
                    Icons.list,
                    color: _screenIndex == 0 ? Colors.blue : Colors.grey,
                  ),
                  Text(
                    'Transactions',
                    style: GoogleFonts.poppins(
                      color: _screenIndex == 0 ? Colors.blue : Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _screenIndex = 1;
                });
              },
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(
                    size: 30,
                    Icons.dashboard,
                    color: _screenIndex == 1 ? Colors.blue : Colors.grey,
                  ),
                  Text(
                    'Dashboard',
                    style: GoogleFonts.poppins(
                      color: _screenIndex == 1 ? Colors.blue : Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _screenIndex = 2;
                });
              },
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(
                    size: 30,
                    Icons.settings,
                    color: _screenIndex == 2 ? Colors.blue : Colors.grey,
                  ),
                  Text(
                    'Settings',
                    style: GoogleFonts.poppins(
                      color:_screenIndex == 2 ? Colors.blue : Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
