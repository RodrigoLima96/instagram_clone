import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/global_variables.dart';

class MobilePageLayout extends StatefulWidget {
  const MobilePageLayout({Key? key}) : super(key: key);

  @override
  State<MobilePageLayout> createState() => _MobilePageLayoutState();
}

class _MobilePageLayoutState extends State<MobilePageLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        children: homePageItems,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
            Icons.home,
            color: _page == 0 ? primaryColor : secondaryColor,
          )),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.search,
            color: _page == 1 ? primaryColor : secondaryColor,
          )),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.add_circle,
            color: _page == 2 ? primaryColor : secondaryColor,
          )),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.favorite,
            color: _page == 3 ? primaryColor : secondaryColor,
          )),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.person,
            color: _page == 4 ? primaryColor : secondaryColor,
          )),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
