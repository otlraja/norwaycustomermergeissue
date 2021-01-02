import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/API/API.dart';
import 'package:norwayfinalcustomer/foodModule/Screen/foodHome.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/SearchBarfood.dart';

import '../../global.dart';
import 'foodcheckout.dart';

class ResturantSelect extends StatefulWidget {
  @override
  _ResturantSelectState createState() => _ResturantSelectState();
}

class _ResturantSelectState extends State<ResturantSelect> {
  var _value = 'Home';
  var indicatorvisible = false;
  var i = 0;

  waittofetchvendorsproducts(var index) async {
    if (i == 0) {
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Food_Home(index)));
      } else {
        waittofetchvendorsproducts(index);
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new DropdownButton<String>(
          value: _value,
          items: <DropdownMenuItem<String>>[
            new DropdownMenuItem(
              child: new Text('Home',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              value: 'Home',
            ),
            new DropdownMenuItem(
                child: new Text(
                  'Office',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                value: 'Office'),
            new DropdownMenuItem(
                child: new Text('Set Location',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                value: 'Set Location'),
            new DropdownMenuItem(
                child: new Text('Other',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                value: 'Other'),
          ],
          onChanged: (String value) {
            setState(() => _value = value);
          },
        ),
        leading: GestureDetector(
          child: Icon(
            Icons.location_on,
            color: Colors.green,
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  showAlertDialog();
                },
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.green[500],
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, right: 20, left: 20),
              child: SearchBarfood(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90.0, right: 30, left: 30),
              child: Text(
                "Got Everything Deliver",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 130.0, left: 20, right: 20),
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(globalvendors.length, (index) {
                  return Container(
                    child: Card(
                      child: InkWell(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icon/food.png",
                              height: 80,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("${globalvendors[index].name}",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        onTap: () {
                          vendorname = globalvendors[index].name.toString();
                          vendoraddress =
                              globalvendors[index].address.toString();
                          vendorid = globalvendors[index].id.toString();
                          if (type == "food") {
                            API.vendorProducts(FoodproductApi +
                                globalvendors[index].id.toString());
                          } else if (type == "grocery") {
                            API.vendorProducts(GroceryProductApi +
                                globalvendors[index].id.toString());
                          } else if (type == "store") {
                            API.vendorProducts(StoreProductApi +
                                globalvendors[index].id.toString());
                          }
                          waittofetchvendorsproducts(index);
                        },
                      ),
                      elevation: 1,
                      color: Colors.grey[200],
                    ),
                  );
                }),
              ),
            ),
            indicatorshow(indicatorvisible)
          ],
        ),
      ),
    );
  }
}