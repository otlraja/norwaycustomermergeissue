import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:norwayfinalcustomer/foodModule/MOdel/FoodmsgCards/foodmsg.dart';

import '../Foodmsg_view.dart';
class Ridersdetail extends StatefulWidget {
  @override
  _RidersdetailState createState() => _RidersdetailState();
}

class _RidersdetailState extends State<Ridersdetail> {

  Widget _getUpperLayer() {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.1,
      maxChildSize: 0.8,
      builder: (BuildContext context, ScrollController scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Container(
            height: MediaQuery.of(context).size.height/2.8,
            color: Colors.white,
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Center(child: Icon(Icons.remove,size: 50,)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [

                          Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.centerLeft,
                            child: Image(
                              image: AssetImage('assets/tshirt.jpg'),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              Text(
                                "Omar norway",
                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:18.0),
                                child: Text(
                                  "Delivery Partner",
                                  style: TextStyle(fontSize: 15,),
                                ),
                              ),
                            ],
                          ),

                          Spacer(),
                          InkWell(

                            child: Icon(
                              Icons.message,
                              color: Colors.green[500],
                            ),
                            onTap: (){
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) => Foodmsgview()));
                            },
                          ),
                          SizedBox(width: 15,),
                          Icon(
                              Icons.phone,
                              color: Colors.green[500]
                          ),
                          SizedBox(width: 10,),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width/1.5,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  icon: Icon(Icons.edit),
                                  border: InputBorder.none,
                                  hintText: 'Any Instruction? E.g No Tomatos'
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          width: MediaQuery.of(context).size.width/1.2,
                          height: MediaQuery.of(context).size.height,
                          child: Stack(
                            children: [
                              Text(
                                'Payment Info',
                                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[500],),
                              ),
                              Positioned(
                                top: 25,
                                child: Text(
                                  'Subtotal',
                                  style: TextStyle(color: Colors.black,fontSize: 13),
                                ),
                              ),

                              Positioned(
                                top: 25,
                                left: 250,
                                child: Text(
                                  '5000.0',
                                  style: TextStyle(color: Colors.black,fontSize: 13),
                                ),
                              ),
                              Positioned(
                                top: 45,
                                child: Text(
                                  'Services Fees',
                                  style: TextStyle(color: Colors.black,fontSize: 13),
                                ),
                              ),

                              Positioned(
                                top: 45,
                                left: 250,
                                child: Text(
                                  '15.0',
                                  style: TextStyle(color: Colors.black,fontSize: 13),
                                ),
                              ),
                              Positioned(
                                top: 65,
                                child: Text(
                                  'Cash On Delivery',
                                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 13),
                                ),
                              ),

                              Positioned(
                                top: 65,
                                left: 250,
                                child: Text(
                                  '15.0',
                                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 13),
                                ),
                              ),
                            ],
                          ),

                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );

      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height:300,
                    child: _getUpperLayer()),
              ),
              Positioned(
                top:10.0,left: 20,
                child: InkWell(child: Icon(Icons.arrow_back,color: Colors.black,),
                onTap: (){
                  Navigator.pop(context);
                },),
              ),

              Positioned(
                  top: 80,
                  left: 20,
                  child: Container(
                      width: 60,
                      height: 60,
                      child: Image(
                          image: AssetImage('assets/1.png')
                      )
                  )
              ),
              Positioned(
                  top: 90,
                  left: 75,
                  child: Row(
                    children: [
                      Text(
                         'Vegatable',
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 100,),
                      Text(
                        'Picked Arranged',
                        style: TextStyle(fontSize: 15,color: Colors.green[500]),
                      ),
                    ],
                  )
              ),
              Positioned(
                  top: 115,
                  left: 90,
                  child: Row(
                    children: [
                      Text(
                        '20 June , 11:58am',
                        style: TextStyle(fontSize: 12,color: Colors.grey[500]),
                      ),
                      SizedBox(width: 100,),
                      Text(
                        '\$11.00 | PayPal',
                        style: TextStyle(fontSize: 12,color: Colors.grey[500]),
                      ),


                    ],
                  )
              ),
              Positioned(
                top: 130,
                left: 90,
                child: Divider(
                  color: Colors.green[500],
                  thickness: 1.0,
                ),
              ),
              Positioned(
                  top: 160,
                  left: 80,
                  child: Row(
                    children: [
                      Icon(
                     Icons.location_on,
                        color: Colors.green[500],
                        size: 15,
                      ),
                      SizedBox(width: 10,),
                      Text(
                        'LiverPool Street 12',
                        style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        '(Norway)',
                        style: TextStyle(fontSize: 12,color: Colors.grey[500],),
                      ),

                    ],
                  )
              ),
              Positioned(
                  top: 190,
                  left: 80,
                  child: Row(
                    children: [
                      Icon(
                        Icons.gps_not_fixed,
                        color: Colors.green[500],
                        size: 15,
                      ),
                      SizedBox(width: 10,),
                      Text(
                        'Home',
                        style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        '(Central Norway)',
                        style: TextStyle(fontSize: 12,color: Colors.grey[500],),
                      ),

                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
