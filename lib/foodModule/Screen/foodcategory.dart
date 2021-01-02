import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:norwayfinalcustomer/HotelsModule/widgets/search_bar.dart';
import 'package:norwayfinalcustomer/foodModule/MOdel/CategoryList.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Color/color.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Style/style.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/SearchBarfood.dart';
import 'package:norwayfinalcustomer/foodModule/foodNavigation.dart';

import 'Food_Profile.dart';
import 'ResturantSelect.dart';
import 'foodHome.dart';
import 'foodTab.dart';
class CategoryFood extends StatefulWidget {
  @override
  _CategoryFoodState createState() => _CategoryFoodState();
}

class _CategoryFoodState extends State<CategoryFood> {

int index=0;
int _currentIndex = 0;
final List<Widget> _children = [
  ResturantSelect(),
  FoodTab(), //Grocery Orde
  // rs
  FoodProfile(), // Grocery earning
];
void onTabTapped(int index) {
  setState(() {
    _currentIndex = index;
    if (_currentIndex == index) {
      setState(() {});
    }
  });
}
var _value='Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          showElevation: false,
          itemCornerRadius: 18,
          curve: Curves.easeInBack,
          onItemSelected: (index) => setState(() {
            _currentIndex = index;
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home',style: TextStyle(color: Colors.grey[500]),),
              activeColor: Colors.green[500],
              inactiveColor: Colors.black,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.shopping_basket),
              title: Text('Order',style: TextStyle(color: Colors.grey[500])),
              activeColor: Colors.green[500],
              inactiveColor: Colors.black,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text(
                'Profile',
                  style: TextStyle(color: Colors.grey[500])
              ),
              activeColor: Colors.green[500],
              inactiveColor: Colors.black,
              textAlign: TextAlign.center,
            ),

          ],
        ),
        body: _children[_currentIndex]
    );
  }

}