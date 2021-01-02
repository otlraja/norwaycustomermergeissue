import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/Component/Color/color.dart';
import 'package:norwayfinalcustomer/Component/Style/style.dart';
import 'package:norwayfinalcustomer/car/pages/Past_Oders.dart';
import 'package:norwayfinalcustomer/car/pages/carooption.dart';
import 'package:norwayfinalcustomer/car/pages/on_goin_Orders.dart';

class OrderTab extends StatefulWidget {


  @override
  _OrderTabState createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTab> {

  List<Widget> containers = [
  Container(
  child:new On_Going_Order(),
  ),
  Container(child: Past_Order()),
];

  //int _currentIndex = 0;


  // final List<Widget> _children = [
  //   CarOption(),
  //   OrderTab(),
  // ];
  //
  // void onTabTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //     if (_currentIndex == index) {
  //       setState(() {});
  //     }
  //   });
  // }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            title: Center(
              child: Text(
                'My Orders',
                style: AppFonts.monmbold1,
              ),
            ),
            backgroundColor: Colors.white,
            bottom: TabBar(
              indicatorPadding: EdgeInsets.symmetric(horizontal: 70),
              indicatorColor: AppColors.tealColor,
              labelPadding: EdgeInsets.symmetric(horizontal: 40.0),
              labelColor: AppColors.tealColor,
              unselectedLabelColor: Colors.grey[400],
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    'On Going Orders',
                    style: AppFonts.monmbold,
                  ),
                ),
                Tab(
                  child: Text(
                    'Past Orders',
                    style: AppFonts.monmbold,
                  ),
                ),

              ],
            ),
          ),
          body: TabBarView(children: containers),
            // bottomNavigationBar: BottomNavigationBar(
            //   selectedIconTheme:
            //   IconThemeData(opacity: 5, color: AppColors.blueColor),
            //   selectedItemColor: AppColors.blueColor,
            //   // fixedColor: Colors.black,
            //
            //   unselectedItemColor: Colors.black,
            //   unselectedIconTheme: IconThemeData(opacity: 5, color: Colors.black),
            //   type: BottomNavigationBarType.fixed,
            //   items: <BottomNavigationBarItem>[
            //     BottomNavigationBarItem(
            //       icon: Container(
            //           width: 25, height: 25, child: Icon(Icons.shopping_cart, color: AppColors.black,)),
            //       title: InkWell(
            //           onTap: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => CarOption()));
            //           },
            //         child: Text(
            //           'Booking',
            //           style: AppFonts.monm,
            //         ),
            //       ),
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Container(
            //           width: 25, height: 25, child: Icon(Icons.shopping_cart, color: AppColors.blueColor,)),
            //       title: Text(
            //         'Order',
            //         style: AppFonts.monm,
            //       ),
            //     ),
            //   ],
            //   // currentIndex: _currentIndex,
            //   //
            //   // onTap: onTabTapped,
            // )),
        ),
      )
      );

  }
}
