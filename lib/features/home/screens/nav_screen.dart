import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fso/core/constants/colors.dart';
import 'package:fso/core/constants/literals.dart';
import 'package:fso/features/home/screens/tabs/profile_screen.dart';
import 'package:fso/features/home/screens/tabs/home_screen.dart';
import 'package:fso/features/home/screens/tabs/recent_requests_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomeScreen(),
          RecentRequestsScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1.0,
              color: AppColors.kGreyColor,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: AppColors.kScaffoldColor,
          selectedLabelStyle: const TextStyle(
            fontFamily: 'DMSans',
            fontWeight: FontWeight.w500,
            fontSize: 10.0,
            color: Colors.black,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'DMSans',
            fontWeight: FontWeight.w500,
            fontSize: 10.0,
            color: AppColors.kGreyColor,
          ),
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppLiterals.navIcon1,
                height: 24.0,
                color: _currentIndex == 0 ? Colors.black : AppColors.kGreyColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppLiterals.navIcon2,
                  height: 24.0,
                  color: _currentIndex == 1 ? Colors.black : AppColors.kGreyColor,
                ),
                label: 'Recent Requests'),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppLiterals.navIcon3,
                height: 24.0,
                color: _currentIndex == 2 ? Colors.black : AppColors.kGreyColor,
              ),
              label: 'My Profile',
            ),
          ],
        ),
      ),
    );
  }
}
