import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/Component/Color/color.dart';
import 'package:norwayfinalcustomer/Component/Style/style.dart';
class CarDeliveryMessage extends StatefulWidget {
  @override
  _CarDeliveryMessageState createState() => _CarDeliveryMessageState();
}

class _CarDeliveryMessageState extends State<CarDeliveryMessage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: [



                 Container(
                   color: Colors.white,
                   height: size.height / 1.4,
                   child: Stack(
                     // alignment: Alignment.center,
                     children: <Widget>[
                       Opacity(
                         child: Container(
                           height: size.height,
                           child: Image.asset(
                             'assets/Delivery.jpg',
                             fit: BoxFit.fill,
                           ),
                         ),
                         opacity: 0.5,
                       ),
                       Container(
                         height: size.height / 6.65,
                         width: size.width,
                         color: Colors.white,
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                             Padding(
                               padding: const EdgeInsets.only(left: 8.0),
                               child: Container(
                                 child: InkWell(child: Icon(Icons.keyboard_arrow_down)),
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(
                                 left: 15,
                                 right: 15,
                                 top: 8,
                               ),
                               child: Row(
                                 children: <Widget>[
                                   CircleAvatar(
                                     radius: 20,
                                     backgroundImage: AssetImage('assets/profile1.png'),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.fromLTRB(15.0, 4, 0, 2),
                                     child: Container(
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: <Widget>[
                                           Text(
                                             'George Anderson',
                                             style: AppFonts.monmbold,
                                           ),
                                           Padding(
                                             padding: const EdgeInsets.only(top: 15.0),
                                             child: Text(
                                               'Delivery Partner',
                                               style: AppFonts.monmgreybold12,
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ),
                                   Spacer(),
                                   Icon(
                                     Icons.call,
                                     color: AppColors.blueColor,
                                   )
                                 ],
                               ),
                             )
                           ],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top: 120),
                         child: Container(
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: <Widget>[
                               Padding(
                                 padding: const EdgeInsets.all(12.0),
                                 child: Card(
                                   color: Colors.white,
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(15.0),
                                   ),
                                   elevation: 5,
                                   child: Container(
                                     height: 80, //size.height / 12,
                                     width: size.width / 2.2,
                                     // decoration: BoxDecoration(
                                     //   borderRadius: BorderRadius.circular(7),
                                     //   color: AppColors.blueColor,
                                     // ),
                                     child: Column(
                                       mainAxisAlignment:
                                           MainAxisAlignment.spaceAround,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: <Widget>[
                                         Container(
                                           height: 40,
                                           child: Text(
                                             'Hey there? \nHow much time? ',
                                             style: AppFonts.monm16,
                                           ),
                                         ),
                                         Container(
                                           width: size.width / 2.2,
                                           alignment: Alignment.topRight,
                                           child: Padding(
                                             padding: const EdgeInsets.all(8.0),
                                             child: Text(
                                               '11:58 am',
                                               style: TextStyle(fontSize: 11),
                                             ),
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                               ),
                               Row(
                                 children: <Widget>[
                                   Spacer(),
                                   Padding(
                                     padding: const EdgeInsets.all(12.0),
                                     child: Card(
                                       color: AppColors.blueColor,
                                       shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(15.0),
                                       ),
                                       elevation: 5,
                                       child: Container(
                                         height: 80, //size.height / 12,
                                         width: size.width / 2.2,
                                         // decoration: BoxDecoration(
                                         //   borderRadius: BorderRadius.circular(7),
                                         //   color: AppColors.blueColor,
                                         // ),
                                         child: Column(
                                           mainAxisAlignment:
                                               MainAxisAlignment.spaceAround,
                                           crossAxisAlignment:
                                               CrossAxisAlignment.center,
                                           children: <Widget>[
                                             Container(
                                               height: 40,
                                               child: Text(
                                                 'Hey there? \nHow much time? ',
                                                 style: AppFonts.monmwhit16,
                                               ),
                                             ),
                                             Container(
                                               width: size.width / 2.2,
                                               alignment: Alignment.topRight,
                                               child: Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Text(
                                                   '11:58 am',
                                                   style: TextStyle(
                                                       color: Colors.white,
                                                       fontSize: 11),
                                                 ),
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ],
                           ),
                         ),
                       )
                     ],
                   ),
                 ),
                 Spacer(),
                 Container(
                   width: MediaQuery.of(context).size.width,
                   child: Divider(),
                 ),
                 Align(
                   alignment: Alignment.bottomCenter,
                   child: Container(
                     height: MediaQuery.of(context).size.height / 17,
                     child: Row(
                       children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.only(left: 5),
                           child: Container(
                             width: MediaQuery.of(context).size.width / 1.12,
                             child: TextField(
                               decoration: InputDecoration(
                                   border: InputBorder.none,
                                   hintText: 'Enter Message'),
                             ),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(bottom: 2),
                           child: Container(
                             child: Icon(
                               Icons.send,
                               color: AppColors.blueColor,
                             ),
                           ),
                         )
                       ],
                     ),
                   ),
                 )
          ],
    ),

      ),
    );
  }
}
