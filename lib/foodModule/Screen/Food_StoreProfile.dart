import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Color/color.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Style/style.dart';



class Alert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Center(child: FoodStoreProfile())));
  }
}

class FoodStoreProfile extends StatefulWidget {
  @override
  _FoodStoreProfileState createState() => _FoodStoreProfileState();
}

class _FoodStoreProfileState extends State<FoodStoreProfile> {
  @override
  Widget dialogBox() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)), //this right here
            child: Container(
                height: MediaQuery.of(context).size.height / 1.8,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 14,
                      width: MediaQuery.of(context).size.width / 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[100],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
                        child: Text('Addresses',
                            style: TextStyle(
                                fontFamily: 'monm', letterSpacing: 1.5)),
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                            activeColor: AppColors.yellowColor,
                            focusColor: AppColors.yellowColor,
                            hoverColor: AppColors.yellowColor,
                            value: 0,

                            // groupValue: _radioValue1,
                            // onChanged: _handleRadioValueChange1,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            height: 20,
                            child: Text(
                              ' Office',
                              style: new TextStyle(
                                  fontFamily: 'monm', fontSize: 16),
                            ),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                            activeColor: AppColors.yellowColor,
                            focusColor: AppColors.yellowColor,
                            hoverColor: AppColors.yellowColor,
                            value: 0,

                            // groupValue: _radioValue1,
                            // onChanged: _handleRadioValueChange1,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            height: 20,
                            child: Text(
                              ' Home',
                              style: new TextStyle(
                                  fontFamily: 'monm', fontSize: 16),
                            ),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                            activeColor: AppColors.yellowColor,
                            focusColor: AppColors.yellowColor,
                            hoverColor: AppColors.yellowColor,
                            value: 0,

                            // groupValue: _radioValue1,
                            // onChanged: _handleRadioValueChange1,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            height: 20,
                            child: Text(
                              ' Friends House',
                              style: new TextStyle(
                                  fontFamily: 'monm', fontSize: 16),
                            ),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                            activeColor: AppColors.yellowColor,
                            focusColor: AppColors.yellowColor,
                            hoverColor: AppColors.yellowColor,
                            value: 0,

                            // groupValue: _radioValue1,
                            // onChanged: _handleRadioValueChange1,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            height: 20,
                            child: Text(
                              ' Current Location',
                              style: new TextStyle(
                                  fontFamily: 'monm', fontSize: 16),
                            ),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                            activeColor: AppColors.yellowColor,
                            focusColor: AppColors.yellowColor,
                            hoverColor: AppColors.yellowColor,
                            value: 0,

                            // groupValue: _radioValue1,
                            // onChanged: _handleRadioValueChange1,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            height: 20,
                            child: Text(
                              ' Mother House',
                              style: new TextStyle(
                                  fontFamily: 'monm', fontSize: 16),
                            ),
                          ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height / 20.5,
                          width: MediaQuery.of(context).size.width / 2.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4),
                            ),
                            color: AppColors.yellowColor,
                          ),
                          child: FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Ok',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ],
                              )),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 20.5,
                          width: MediaQuery.of(context).size.width / 2.7,
                          decoration: BoxDecoration(
                              color: AppColors.yellowColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4))),
                          child: FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'CANCEL',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ],
                )),
          );
        });
  }

  String _time = "Not set";

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey[50],
            resizeToAvoidBottomPadding: false,
            body: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Container(
                          child:
                              Text('My Profile', style: AppFonts.monmbold20),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: size.height / 1.4,
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                width: size.width,
                                height: size.height / 5.1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      height: 40,
                                      width: size.width,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            12, 8, 12, 4),
                                        child: Text('Profile Image',
                                            style: AppFonts.monmgrey),
                                      ),
                                    ),
                                    Spacer(),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: size.width / 3,
                                          height: size.height / 8,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                16, 0, 8, 0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/tshirt.jpg',
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: size.width / 1.55,
                                          height: size.height / 22,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Icon(
                                                Icons.photo_camera,
                                                color: AppColors.yellowColor,
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: Text(' Change Photo',
                                                    style: AppFonts.monmyellow),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              height: size.height / 1.8,
                              width: size.width / 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 8, 16, 8),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 10,),
                                    /*Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: Text('STORE INFO',
                                          style: AppFonts.monmgrey),
                                    ),*/
                                    Container(
                                      height: size.height / 10,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(' Name',
                                              style: AppFonts.monm),
                                          Container(
                                            height: 40,
                                            child: TextField(
                                              style: TextStyle(
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                hintStyle: AppFonts.monrblack,
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                  color: Colors.grey[300],
                                                )),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                  color: AppColors.yellowColor,
                                                )),
                                                hintText: 'Omar',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        dialogBox();
                                      },
                                      child: Container(
                                        height: size.height / 10,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('Address',
                                                style: AppFonts.monm),
                                            Container(
                                                height: 20,
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      'Current Location',
                                                      style: AppFonts.monm,
                                                    ),
                                                    Spacer(),
                                                    Icon(Icons
                                                        .keyboard_arrow_down)
                                                  ],
                                                )),
                                            Divider(
                                              thickness: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: size.height / 8.4,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Phone Number',
                                              style: AppFonts.monm),
                                          Container(
                                            child: TextField(
                                              style: TextStyle(
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                hintStyle: TextStyle(
                                                    fontFamily: 'monr',
                                                    color: Colors.black),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                  color: Colors.grey[300],
                                                )),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                  color: AppColors.yellowColor,
                                                )),
                                                hintText: '+920888121232',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: size.height / 8.9,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Email Address',
                                              style: AppFonts.monm),
                                          Container(
                                            height: size.height / 13.4,
                                            child: TextField(
                                              style: AppFonts.monm,
                                              decoration: InputDecoration(
                                                hintStyle: AppFonts.monm,
                                                prefixIcon: Icon(
                                                  Icons.location_on,
                                                  size: 18,
                                                  color: AppColors.yellowColor,
                                                ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                  color: Colors.grey[300],
                                                )),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                  color: AppColors.yellowColor,
                                                )),
                                                hintText: 'akbbokers@email',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: size.width,
                    height: size.height / 12,
                    color: AppColors.yellowColor,
                    child: Center(
                      child: Text(' Update info', style: AppFonts.monmwhit16),
                    ),
                  )
                ],
              ),
            )));
  }
}
