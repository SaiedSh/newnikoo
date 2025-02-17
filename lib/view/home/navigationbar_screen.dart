import 'package:bookapp/model/global/global.dart';
import 'package:bookapp/view/home/all_books.dart';
import 'package:bookapp/view/home/home_screen.dart';
import 'package:bookapp/view/saved/main_screen.dart';
import 'package:bookapp/view/subscription/buy_subs_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// class NavigationbarScreen extends StatefulWidget {
//   const NavigationbarScreen({super.key});

//   @override
//   State<NavigationbarScreen> createState() => _NavigationbarScreenState();
// }

// class _NavigationbarScreenState extends State<NavigationbarScreen> {
//   int _selectedIndex = 0;
//   static const List<Widget> _widgetOptions = <Widget>[
//     HomeScreen(),
//     Text('2'),
//     Text('3'),
//     Text('4')
//   ];
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _widgetOptions.elementAt(_selectedIndex),
//       bottomNavigationBar: Directionality(
//         textDirection: TextDirection.rtl,
//         child: SizedBox(
//           height: 70,
//           child: BottomNavigationBar(
//             type: BottomNavigationBarType.fixed,
//             unselectedLabelStyle:
//                 GoogleFonts.vazirmatn(fontWeight: FontWeight.w500, fontSize: 10),
//             selectedLabelStyle: GoogleFonts.vazirmatn(
//                 color: primaryColor, fontWeight: FontWeight.w500, fontSize: 10),
//             showSelectedLabels: true,
//             selectedItemColor: primaryColor,
//             showUnselectedLabels: true,
//             unselectedItemColor: primaryColor,
//             backgroundColor: Colors.white,
//             onTap: _onItemTapped,
//             currentIndex: _selectedIndex,
//             items: <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                 icon: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Image(
//                       image: AssetImage('lib/assets/images/home.png'),
//                       fit: BoxFit.fill,
//                       width: 25,
//                       height: 30,
//                     ),
//                     Text('خانه'),
//                     if (_selectedIndex == 0)
//                       Container(height: 5, color: Colors.blue)
//                   ],
//                 ),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Image(
//                   image: AssetImage('lib/assets/images/plus.png'),
//                   width: 25,
//                   height: 25,
//                 ),
//                 label: 'نیکو پلاس',
//               ),
//               BottomNavigationBarItem(
//                   icon: Image(
//                     image: AssetImage('lib/assets/images/category.png'),
//                     width: 25,
//                     height: 25,
//                   ),
//                   label: 'دسته بندی'),
//               BottomNavigationBarItem(
//                   icon: Image(
//                     image: AssetImage('lib/assets/images/library.png'),
//                     width: 25,
//                     height: 25,
//                   ),
//                   label: 'کتابخانه من'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// class NavigationbarScreen extends StatefulWidget {
//   const NavigationbarScreen({super.key});

//   @override
//   State<NavigationbarScreen> createState() => _NavigationbarScreenState();
// }

// class _NavigationbarScreenState extends State<NavigationbarScreen> {
//   int _selectedIndex = 0;
//   final List<Widget> _pages = [
//     HomeScreen(),
//     Center(child: Text('Niko Plus', style: GoogleFonts.vazirmatn(fontSize: 24))),
//     AllBooksScreen(),
//     ShelfScreen()
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: _selectedIndex, // صفحه فعال
//         children: _pages, // صفحات
//       ),
//       bottomNavigationBar: CustomBottomNavigationBar(
//         selectedIndex: _selectedIndex,
//         onItemTapped: _onItemTapped,
//       ),
//     );
//   }
// }

// class CustomBottomNavigationBar extends StatelessWidget {
//   final int selectedIndex;
//   final Function(int) onItemTapped;

//   CustomBottomNavigationBar(
//       {required this.selectedIndex, required this.onItemTapped});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 70,
//       padding: EdgeInsets.all(5),
//       color: Colors.white, // رنگ پس زمینه نوار
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             _buildNavItem('lib/assets/images/home.png', "خانه", 0, 25, 25, 0),
//             _buildNavItem(
//                 'lib/assets/images/plus.png', "نیکو پلاس", 1, 28, 25, 0),
//             _buildNavItem('lib/assets/images/category2.png', "دسته بندی ها", 2,
//                 20, 22, 3),
//             _buildNavItem(
//                 'lib/assets/images/library.png', "کتابخانه من", 3, 22, 25, 0),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildNavItem(String imagePath, String label, int index, double? width,
//       double? height, double categoryHeight) {
//     bool isSelected = selectedIndex == index;
//     return SizedBox(
//       width: 70,
//       height: 49,
//       child: GestureDetector(
//         onTap: () => onItemTapped(index),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Image(
//                 image: AssetImage(imagePath),
//                 width: width,
//                 height: height,
//                 fit: BoxFit.fill,
//                 color: isSelected ? secondaryColor : Colors.black),
//             SizedBox(
//               height: categoryHeight,
//             ),
//             Text(
//               label,
//               style: GoogleFonts.vazirmatn(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 10,
//                 color: isSelected ? secondaryColor : Colors.black,
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             if (isSelected)
//               Container(height: 4, color: secondaryColor, width: 40),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class NavigationbarScreen extends StatefulWidget {
//   const NavigationbarScreen({super.key});

//   @override
//   State<NavigationbarScreen> createState() => _NavigationbarScreenState();
// }

// class _NavigationbarScreenState extends State<NavigationbarScreen> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     if (_selectedIndex != index) {
//       setState(() {
//         _selectedIndex = index;
//       });
//       _navigateToPage(index);
//     }
//   }

//   void _navigateToPage(int index) {
//     // هر بار که ایندکس تغییر کرد، صفحه جدید را push می‌کند.
//     Widget page;
//     switch (index) {
//       case 0:
//         page = HomeScreen();
//         break;
//       case 1:
//         page = Center(child: Text('Niko Plus', style: GoogleFonts.vazirmatn(fontSize: 24)));
//         break;
//       case 2:
//         page = AllBooksScreen();
//         break;
//       case 3:
//         page = ShelfScreen();
//         break;
//       default:
//         page = HomeScreen();
//     }
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => page),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _buildCurrentPage(), // صفحه فعلی که بر اساس ایندکس انتخاب می‌شود
//       bottomNavigationBar: CustomBottomNavigationBar(
//         selectedIndex: _selectedIndex,
//         onItemTapped: _onItemTapped,
//       ),
//     );
//   }

//   Widget _buildCurrentPage() {
//     // نمایش صفحه فعلی بر اساس ایندکس
//     switch (_selectedIndex) {
//       case 0:
//         return HomeScreen();
//       case 1:
//         return Center(child: Text('Niko Plus', style: GoogleFonts.vazirmatn(fontSize: 24)));
//       case 2:
//         return AllBooksScreen();
//       case 3:
//         return ShelfScreen();
//       default:
//         return HomeScreen();
//     }
//   }
// }
class NavigationbarScreen extends StatefulWidget {
  const NavigationbarScreen({super.key});

  @override
  State<NavigationbarScreen> createState() => _NavigationbarScreenState();
}

class _NavigationbarScreenState extends State<NavigationbarScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index); // صفحه جدید را بدون انیمیشن نمایش می‌دهد
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          HomeScreen(),
          BuySubsScreen(),
          CategoryScreen(),
          MainScreen()
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.all(5),
      color: Colors.white,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem('lib/assets/images/home.png', "خانه", 0, 25, 25, 0),
            _buildNavItem(
                'lib/assets/images/plus.png', "نیکو پلاس", 1, 28, 25, 0),
            _buildNavItem('lib/assets/images/category2.png', "دسته بندی ها", 2,
                20, 22, 3),
            _buildNavItem(
                'lib/assets/images/library.png', "کتابخانه من", 3, 22, 25, 0),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String imagePath, String label, int index, double? width,
      double? height, double categoryHeight) {
    bool isSelected = selectedIndex == index;
    return SizedBox(
      width: 70,
      height: 49,
      child: InkWell(
        onTap: () => onItemTapped(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: AssetImage(imagePath),
              width: width,
              height: height,
              fit: BoxFit.fill,
              color: isSelected ? secondaryColor : Colors.black,
            ),
            SizedBox(height: categoryHeight),
            Text(
              label,
              style: GoogleFonts.vazirmatn(
                fontWeight: FontWeight.w600,
                fontSize: 10,
                color: isSelected ? secondaryColor : Colors.black,
              ),
            ),
            SizedBox(height: 5),
            if (isSelected)
              Container(height: 4, color: secondaryColor, width: 40),
          ],
        ),
      ),
    );
  }
}
