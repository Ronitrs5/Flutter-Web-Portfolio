import 'package:flutter/material.dart';
import 'package:myportfolioflutter/colors/colors.dart';
import 'package:myportfolioflutter/sidebar_pages/aboutme.dart';
import 'package:myportfolioflutter/sidebar_pages/contactme.dart';
import 'package:myportfolioflutter/sidebar_pages/education.dart';
import 'package:myportfolioflutter/sidebar_pages/home.dart';
import 'package:myportfolioflutter/sidebar_pages/projects.dart';
import 'package:myportfolioflutter/sidebar_pages/work.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'dart:math' as math show pi;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late List<CollapsibleItem> _items;
  late String _headline;
  late PageController _pageController;
  int _currentPageIndex = 0;
  AssetImage _avatarImg = AssetImage('assets/images/img_ronit.png');

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _pageController = PageController(initialPage: _currentPageIndex);
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Home',
        icon: Icons.home_rounded,
        onPressed: () {
          _navigateToPage(0);
        },
        isSelected: true,
      ),

      CollapsibleItem(
        text: 'About me',
        icon: Icons.person_rounded,
        onPressed: () {
          _navigateToPage(1);
        },
      ),

      CollapsibleItem(
        text: 'Work-Experience',
        icon: Icons.work_rounded,
        onPressed: () {
          _navigateToPage(2);
        },
      ),

      CollapsibleItem(
        text: 'Projects',
        icon: Icons.file_copy_rounded,
        onPressed: () {
          _navigateToPage(3);
        },
      ),

      CollapsibleItem(
        text: 'Contact me',
        icon: Icons.email_rounded,
        onPressed: () {
          _navigateToPage(4);
        },
      ),
    ];
  }

  void _navigateToPage(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {
      _currentPageIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.mainbk3,
      body: Stack(
          children: [
        Row(
          children: [
            Expanded(
              child: CollapsibleSidebar(
                isCollapsed: true,
                items: _items,
                collapseOnBodyTap: false,
                showTitle: false,
                showToggleButton: true,
                toggleTitle: "",
                selectedIconBox: Colors.transparent,
                iconSize: 30,
                selectedIconColor: Colors.deepPurple,
                unselectedTextColor: Colors.white70,
                unselectedIconColor: Colors.white70,
                selectedTextColor: Colors.deepPurple,

                body: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPageIndex = index;
                    });
                  },
                  children: [
                    _body(size, context, 0),
                    _body(size, context, 1),
                    _body(size, context, 2),
                    _body(size, context, 3),
                    _body(size, context, 4),
                    _body(size, context, 5),
                    // Add other pages here
                  ],
                ),
                backgroundColor: AppColors.mainbk3,
                textStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                titleStyle: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
                toggleTitleStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                sidebarBoxShadow: [

                  BoxShadow(
                    color: AppColors.mainbk3,
                    // blurRadius: 20,
                    // spreadRadius: 0.01,
                    offset: Offset(3, 3),
                  ),
                  BoxShadow(
                    color: AppColors.mainbk3,
                    // blurRadius: 50,
                    // spreadRadius: 0.01,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Widget _body(Size size, BuildContext context, int pageIndex) {
    switch (pageIndex) {
      case 0:
        return HomePage();

      case 1:
        return AboutMe();

      case 2:
        return Work();

      case 3:
        return Projects();

      case 4:
        return ContactMe();

      default:
        return Container();
    }
  }
}
