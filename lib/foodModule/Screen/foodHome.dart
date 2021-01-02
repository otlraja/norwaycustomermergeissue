import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/API/API.dart';
import 'package:norwayfinalcustomer/Registration/login.dart';
import 'package:norwayfinalcustomer/Models/products.dart';
import 'package:norwayfinalcustomer/RegistrationApi/Login.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Style/style.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/SearchBarfood.dart';
import 'package:norwayfinalcustomer/global.dart';
import '../../global.dart';
import '../../main.dart';
import 'FoodReview.dart';
import 'foodcheckout.dart';

bool val = false;

class Food_Home extends StatefulWidget {
  final index;
  Food_Home(this.index);
  static Widget carttext() {
    if (globalfoodcart.length != 0) {
      val = true;
      return Text(
        'Item : ' +
            globalfoodcart.length.toString() +
            ' | \$ ' +
            cartprice.toString(),
        style: TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      );
    } else {
      val = false;
      return Text(
        'Item : 0 | \$ 0.0',
        style: TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      );
    }
  }
  @override
  _Food_HomeState createState() => _Food_HomeState();
}

class _Food_HomeState extends State<Food_Home> {

  var indicatorvisible = false;
  var i = 0;
  showAlertDialog() {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Delivery", style: TextStyle(color: Colors.green)),
      onPressed: () {
        deliverytype = "AK Bookers Rider";
        Navigator.pop(context);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => FoodCheckout()));
      },
    );
    Widget cancel = FlatButton(
      child: Text("Cancel", style: TextStyle(color: Colors.red)),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Take a Way", style: TextStyle(color: Colors.pinkAccent)),
      onPressed: () {
        deliverytype = "Take A way";
        Navigator.pop(context);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => FoodCheckout()));
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("How Do You Like To Take Order",
          style: TextStyle(color: Colors.green[300])),
      actions: [
        cancelButton,
        cancel,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialoglogin() {
    // set up the buttons
    Widget cancel = FlatButton(
      child: Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text("Close", style: TextStyle(color: Colors.green)))),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(

      child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 40,
          width: 80,

          child: Center(child: Text("SignIn", style: TextStyle(color: Colors.white)))),
      onPressed: () {
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => Loginapi()));
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),

      title: Text("First SignIn to View Cart! ", style: TextStyle(color: Colors.green[300], fontSize: 14)),
      actions: [
        cancel,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogcart() {

    // set up the buttons
    Widget no = FlatButton(
      child: Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text("Close", style: TextStyle(color: Colors.green)))),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget yes = FlatButton(

      child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 40,
          width: 80,

          child: Center(child: Text("Continue", style: TextStyle(color: Colors.white)))),
      onPressed: () {

        globalfoodcart.clear();
        cartprice = 0.0;

        MyApp.sharedPreferences.setString("cartprice",
            cartprice.toString());
        final String
        encodedData =
        Products.encodeMusics(globalfoodcart);
        MyApp.sharedPreferences.setString("foodcart",
            encodedData);
        setState(() {
          Food_Home.carttext();
        });

        Navigator.pop(context);

        // Navigator.of(context).push(MaterialPageRoute(builder: (_) => Login()));
      },
    );
    // set up the AlertDialog

    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),

      title: Text("You have already selected products form a different vendor. If you continues, Your cart and selection will be removed",

        style: TextStyle(color: Colors.green, fontSize: 14),
      ),
      actions: [
        no,
        yes,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  @override
  void initState() {
    calculatequantity();
    super.initState();
  }

  void calculatequantity() {
    for (int i = 0; i < globalproductType.length; i++) {
      for (int j = 0; j < globalproductType[i].product.length; j++) {
        var a = globalproductType[i].product[j].id;

        var b = globalfoodcart.where((element) => element.id == a);

        if (b.length != 0) {
          globalproductType[i].product[j] = b.first;
        }
      }
    }
  }

  void calculateprice() {
    cartprice = 0.0;
    for (int i = 0; i < globalfoodcart.length; i++) {
      cartprice += globalfoodcart[i].price;
      print(cartprice.toString());
    }

    Food_Home.carttext();
  }

  waittofetchvendorsreviews(var index)async{
    if(i == 0){
      setState(() {
        indicatorvisible = true;
      });
    }
    i++;
    await Future.delayed(const Duration(seconds: 1), () {
      if (API.success == 'true') {
        setState(() {
          indicatorvisible = false;
        });
        i = 0;
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => FoodReview(widget.index)));
      }
      else {
        waittofetchvendorsreviews(index);
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: globalproductType.length,
          child: Column(
            children: [
              Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Icon(Icons.arrow_back),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        vendorname,
                        style: AppFonts.monmbold1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          if (usertoken != null) {
                            showAlertDialog();
                          } else {
                            showAlertDialoglogin();
                          }
                        },
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.green[500],
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.location_on,
                    color: Colors.grey[500],
                    size: 10,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '6.4 | ' + vendoraddress,
                    style: TextStyle(color: Colors.grey[500], fontSize: 10),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.timer,
                    color: Colors.grey[500],
                    size: 10,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '20 MINS',
                    style: TextStyle(color: Colors.grey[500], fontSize: 10),
                  ),
                  Spacer(),

                  InkWell(
                    onTap: () {
                      if(globalvendors[widget.index].totalReviews != 0) {
                        if (type == "food") {
                          API.vendorreviews(
                              vendorreviewsAPI + globalvendors[widget.index].id
                                  .toString());
                          waittofetchvendorsreviews(widget.index);
                        }
                        else if(type=="grocery"){
                          API.vendorreviews(groceryvendorreviewsAPI+globalvendors[widget.index].id.toString());
                          waittofetchvendorsreviews(widget.index);
                        }
                        else if(type=="store"){
                          API.vendorreviews(storevendorreviewsAPI+globalvendors[widget.index].id.toString());
                          waittofetchvendorsreviews(widget.index);
                        }

                      }
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.green[500],
                            size: 12,
                          ),
                          Text(
                            double.parse(globalvendors[widget.index].avgRating.toString()).toStringAsFixed(1).toString()+' ',
                            style: TextStyle(color: Colors.green[500], fontSize: 12),
                          ),
                          Text(
                            globalvendors[widget.index].totalReviews.toString()+' Reviews',
                            style: TextStyle(color: Colors.grey[500], fontSize: 12),
                          ),

                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey[500],
                            size: 12,
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SearchBarfood(),
              ),
              Container(
                color: Colors.white,
                constraints: BoxConstraints.expand(height: 60),
                child: TabBar(
                  //controller: _tabController,
                  isScrollable: true,
                  tabs: List.generate(
                    globalproductType.length,
                        (i) => Tab(
                      child: Container(
                        alignment: Alignment.center,
                        constraints: BoxConstraints.expand(width: 80),
                        child: Text(
                          globalproductType[i].name,
                          style: AppFonts.monmbold,
                        ),
                      ),
                    ),
                  ),
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 70),
                  labelPadding: EdgeInsets.symmetric(horizontal: 40.0),
                  unselectedLabelColor: Colors.grey[400],
                  labelColor: Colors.green[500],
                  indicatorColor: Colors.green[500],
                ),
              ),
              Expanded(
                child: Container(
                  child: TabBarView(
                    children: List.generate(
                      globalproductType.length,
                          (i) => SingleChildScrollView(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.8,
                          child: globalproductType[i].product.length == null
                              ? Container(
                            padding: EdgeInsets.only(bottom: 100),
                            child: Center(
                                child: Text(
                                  "No Items Available",
                                  style: AppFonts.monmboldgrey,
                                )),
                          )
                              : Container(
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 60),
                                scrollDirection: Axis.vertical,
                                itemCount:
                                globalproductType[i].product.length,
                                itemBuilder: (_, index) {
                                  return InkWell(
                                    // onTap: ontap,
                                    child: Container(
                                        color: Colors.white,
                                        padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                                        child: Column(
                                          // mainAxisSize:
                                          //     MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(
                                                      left: 0.0,
                                                      top: 5),
                                                  child: Container(
                                                    height: 85,
                                                    width: 85,
                                                    decoration:
                                                    BoxDecoration(
                                                        image:
                                                        DecorationImage(
                                                          fit:
                                                          BoxFit.fill,
                                                          image:
                                                          NetworkImage(
                                                            globalproductType[
                                                            i]
                                                                .product[
                                                            index]
                                                                .image,
                                                          ),
                                                        )),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 5,
                                                      left: 10),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Text(
                                                          globalproductType[
                                                          i]
                                                              .product[
                                                          index]
                                                              .name,
                                                          style: AppFonts
                                                              .monmblack),
                                                      Padding(
                                                        padding:
                                                        EdgeInsets
                                                            .only(
                                                          top: 4.0,
                                                        ),
                                                        child: Text(
                                                          "\$ " +
                                                              globalproductType[i]
                                                                  .product[index]
                                                                  .price
                                                                  .toString(),
                                                          textAlign:
                                                          TextAlign
                                                              .left,
                                                          style: AppFonts
                                                              .monrblack,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Spacer(),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 50),
                                                  child: Container(
                                                    height: 40,
                                                    decoration:
                                                    BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors
                                                              .green[
                                                          500]),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          20),
                                                    ),
                                                    child: Row(
                                                      children: <
                                                          Widget>[
                                                        globalproductType[i]
                                                            .product[index]
                                                            .orderquantity !=
                                                            0
                                                            ? new IconButton(
                                                          icon:
                                                          new Icon(Icons.remove),
                                                          onPressed: () =>
                                                              setState(() {
                                                                globalproductType[i].product[index].orderquantity--;
                                                                var a = globalfoodcart.where((element) =>
                                                                element.id ==
                                                                    globalproductType[i].product[index].id);
                                                                globalfoodcart.remove(a.first);
                                                                globalproductType[i].product[index].quantityoncheckout =
                                                                    a.length - 1;
                                                                calculateprice();
                                                                MyApp.sharedPreferences.setString("cartprice",
                                                                    cartprice.toString());
                                                                final String
                                                                encodedData =
                                                                Products.encodeMusics(globalfoodcart);
                                                                MyApp.sharedPreferences.setString("foodcart",
                                                                    encodedData);
                                                                Food_Home.carttext();
                                                                //}
                                                              }),
                                                        )
                                                            : new Container(),
                                                        globalproductType[i]
                                                            .product[
                                                        index]
                                                            .orderquantity !=
                                                            0
                                                            ? new Text(globalproductType[
                                                        i]
                                                            .product[
                                                        index]
                                                            .orderquantity
                                                            .toString())
                                                            : new Container(),
                                                        new IconButton(
                                                            icon: new Icon(
                                                                Icons
                                                                    .add),
                                                            onPressed:
                                                                () {

                                                              if( globalfoodcart.isEmpty || globalfoodcart[0].vendorid.toString() == vendorid.toString())
                                                              {
                                                                setState(
                                                                        () {
                                                                      globalproductType[i]
                                                                          .product[index]
                                                                          .orderquantity++;

                                                                      globalfoodcart
                                                                          .add(globalproductType[i].product[index]);

                                                                      var a = globalfoodcart.where((element) =>
                                                                      element.id ==
                                                                          globalproductType[i].product[index].id);

                                                                      if (a.length !=
                                                                          0) {
                                                                        globalproductType[i].product[index].quantityoncheckout =
                                                                            a.length;
                                                                      }

                                                                      calculateprice();
                                                                      MyApp.sharedPreferences.setString(
                                                                          "cartprice",
                                                                          cartprice.toString());

                                                                      final String
                                                                      encodedData =
                                                                      Products.encodeMusics(globalfoodcart);
                                                                      MyApp.sharedPreferences.setString(
                                                                          "foodcart",
                                                                          encodedData);

                                                                      setState(
                                                                              () {
                                                                            Food_Home.carttext();
                                                                          });
                                                                    }
                                                                  //}
                                                                );
                                                              }
                                                              else{
                                                                showAlertDialogcart();
                                                              }

                                                            }),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              thickness: 1,
                                            ),
                                          ],
                                        )),
                                  );
                                }),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              indicatorshow(indicatorvisible),
            ],
          ),
        ),

      ),
      bottomNavigationBar: Container(
        color: Colors.green[200],
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: BottomAppBar(
          color: Colors.transparent,
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),

              Food_Home.carttext(),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: InkWell(
                  child: Container(
                    width: 80,
                    height: 35,
                    alignment: Alignment.center,
                    child: Text(
                      'View Cart',
                      style: TextStyle(color: Colors.green),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onTap: () {
                    if (usertoken != null) {
                      showAlertDialog();
                    } else {
                      showAlertDialoglogin();
                    }
                  },
                ),
              )
            ],
          ),
          elevation: 0,
        ),
      ),
    );
  }
}