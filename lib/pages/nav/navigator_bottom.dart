import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toturial/pages/nav/profilepage.dart';
import 'package:flutter_toturial/pages/nav/homepage.dart';
import 'package:flutter_toturial/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigatorBottom extends StatefulWidget {
  const NavigatorBottom({super.key});

  @override
  State<NavigatorBottom> createState() => _NavigatorBottomState();
}

class _NavigatorBottomState extends State<NavigatorBottom> {
  int selectedIndex = 0;
  List<Widget> pageList = [];

  @override
  void initState() {
    pageList.add(HomePage());
    pageList.add(ProfilePage());

    super.initState();
  }

  void onItemMenu(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: tr('home'),
            icon: Icon(
              Icons.home,
              size: 28,
            ),
          ),
          BottomNavigationBarItem(
            label: tr('Profile'),
            icon: Icon(
              Icons.person,
              size: 28,
            ),
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: cr_3c9,
        selectedLabelStyle: GoogleFonts.notoSansLao(),
        unselectedLabelStyle: GoogleFonts.notoSansLao(),
        onTap: onItemMenu,
      ),
    );
  }
}
