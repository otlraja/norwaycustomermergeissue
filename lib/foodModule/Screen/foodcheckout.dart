import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/API/API.dart';
import 'package:norwayfinalcustomer/PaymentCardSelect.dart';
import 'package:norwayfinalcustomer/foodModule/MOdel/Food_Checkout/foodcheckout_builder.dart';
import 'package:norwayfinalcustomer/foodModule/Screen/foodNewOrder/RidersDetails.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Style/style.dart';
import '../../global.dart';

class FoodCheckout extends StatefulWidget {
  @override
  _FoodCheckoutState createState() => _FoodCheckoutState();
}

class _FoodCheckoutState extends State<FoodCheckout> {
  var indicatorvisible = false;
  var i = 0;
  final notecontroller = TextEditingController();


  @override
  void initState() {
    if(selectedcardindex == null){
      selectedcardindex = "0";
    }
    super.initState();
  }

  void  getSelectedpayment(String paymentflag){
    setState(() {
      if(paymentflag == 'cash'){
        selectpaymenttype = paymentflag;
      }else{
        selectpaymenttype = 'card';
        selectedcardindex = paymentflag;
      }
    });

  }


  showAlertDialogThankyou() {
    // set up the buttons
    Widget yes = FlatButton(
      child: Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text("OK", style: TextStyle(color: Colors.green)))),
      onPressed: (){
        Navigator.pop(context);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => Ridersdetail()));
      },
    );

    // set up the AlertDialog

    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),

      title: Text("ThankYou \n Your Order Submitted Successfully !",

        style: TextStyle(color: Colors.green, fontSize: 14),
      ),
      actions: [
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

  showAlertDialogError() {
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
    // set up the AlertDialog

    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),

      title: Text("Something Went Wrong ! ",

        style: TextStyle(color: Colors.green, fontSize: 14),
      ),
      actions: [
        no,
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


  waitforcheckout()async{
    if(i == 0){
      setState(() {
        indicatorvisible = true;
        //indicator();
      });
    }
    i++;
    //pr.show();
    await Future.delayed(const Duration(seconds: 1), () {
      if (API.success == 'true') {
        setState(() {
          indicatorvisible = false;
        });
        i = 0;
        //pr.hide();
        showAlertDialogThankyou();
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (_) => FoodReview(widget.index)));
      }
      else if(API.success == 'error'){
        setState(() {
          indicatorvisible = false;
        });
        i = 0;
        showAlertDialogError();
      }
      else {
        waitforcheckout();
      }
    });
  }


  Future<bool> _willPopCallback() async {
    // setState(() {
    //   widget.popup();
    // });
    Navigator.pop(context);
    // await showDialog or Show add banners or whatever
    // then
    return true; // return true if the route to be popped
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: WillPopScope(
          onWillPop: _willPopCallback,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      //height: size.height / 1.237,
                      child: Column(
                        children: <Widget>[
                          Container(
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Padding(
                                  padding: const EdgeInsets.only(left: 10,),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        color: Colors.white,
                                        //height: size.height / 12,
                                        child: IconButton(
                                          icon: Icon(Icons.arrow_back_ios),
                                          onPressed: () {
                                            // setState(() {
                                            //   widget.popup();
                                            // });
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                      Container(
                                          padding: EdgeInsets.only(left: 10),
                                          color: Colors.white,
                                          height: size.height / 20,
                                          child: Image.asset('assets/pro.png')),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        //width: size.width / 2,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              username != null ? username : "Omar",
                                              style: AppFonts.monm,
                                            ),
                                            Text(
                                              '20 Jun, 11:35 am',
                                              style: AppFonts.monmgrey12,
                                            )
                                          ],
                                        ),
                                      ),
                                      // Spacer(),
                                      // Container(
                                      //
                                      //   //width: size.width / 7,
                                      //   child: IconButton(
                                      //       // color: Color(0xff7ac81d),
                                      //       color: Colors.green[500],
                                      //       icon: Icon(Icons.message),
                                      //       onPressed: () {
                                      //         Navigator.of(context).push(
                                      //             MaterialPageRoute(
                                      //                 builder: (_) =>
                                      //                     Foodmsgview()));
                                      //       }),
                                      // ),
                                      // Container(
                                      //   padding: EdgeInsets.only(right: 10),
                                      //   child: IconButton(
                                      //       color: Colors.green[500],
                                      //       icon: Icon(Icons.phone),
                                      //       onPressed: () {}),
                                      // )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FoodCheckoutList(),
                          Container(
                            color: Colors.white,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: notecontroller,
                                decoration: InputDecoration(
                                    icon: Icon(Icons.edit),
                                    border: InputBorder.none,
                                    hintText: 'Any Instruction? E.g No Tomatos'
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 400,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Container(
                                      height: 40,
                                      child: Text(
                                        'PAYMENT INFO',
                                        style: AppFonts.monmgreybold12,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Text('Sub Total'),
                                            Spacer(),
                                            Container(
                                                width: 60,
                                                child: Text(
                                                  "\$ "+cartprice.toString(),
                                                  style: AppFonts.monm,
                                                )),
                                          ],
                                        )),
                                  ),
                                  Container(
                                    child: Divider(
                                      thickness: 0.5,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              'Sales Tax',
                                              style: AppFonts.monm,
                                            ),
                                            Spacer(),
                                            Container(
                                                width: 60,
                                                child: Text(
                                                  '\$ '+sales_tax.toString(),
                                                  style: AppFonts.monm,
                                                )),
                                          ],
                                        )),
                                  ),
                                  Container(
                                    child: Divider(
                                      thickness: 0.5,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              'Delivery Charges',
                                              style: AppFonts.monm15bold,
                                            ),
                                            Spacer(),
                                            Container(
                                                width: 60,
                                                child: Text(
                                                  '\$ '+(double.parse(sales_tax.toString())+double.parse(cartprice.toString())).toString(),
                                                  style: AppFonts.monm15bold,
                                                )),
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 60,
                            child: Container(
                                color: Colors.white,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            child: CircleAvatar(
                                              radius: 20,
                                              child: Image.asset('assets/1.png'),
                                            ),
                                          ),
                                          Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(left:8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    globalfoodcart.isEmpty ? vendorname: globalfoodcart[0].vendorname,
                                                    style: AppFonts.monm,
                                                  ),
                                                  Text(
                                                    deliverytype,
                                                    style: AppFonts.monm,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            margin: EdgeInsets.only(right: 12),
                                            child: Icon(
                                              Icons.arrow_drop_up,
                                              color: Colors.green[500],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height/7.5,
                            child: Container(

                                color: Colors.white,
                                child: InkWell(
                                  onTap: (){
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (_) => PaymentCardDetails(getSelectedpayment: getSelectedpayment,)));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[

                                        Row(
                                          children: [
                                            Text('Payment Method',style: TextStyle(fontWeight: FontWeight.bold),),
                                            Spacer(),
                                            Text('Change',style:TextStyle(color: Colors.green[200])),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:10.0),
                                          child: selectpaymenttype == "card"?
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                alignment:Alignment.center,
                                                child: Icon(
                                                  Icons.credit_card,
                                                  color: Colors.green[500],
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(left:12.0),
                                                child: Text(
                                                  credit.isNotEmpty?
                                                  credit[
                                                  selectedcardindex == null ? 0
                                                      : int.parse(selectedcardindex)
                                                  ].cardNumber
                                                      : "Cash on Delivery",
                                                  style: AppFonts.monm,
                                                ),
                                              ),
                                              Spacer(),
                                              Container(
                                                child: Column(
                                                  children: [
                                                    Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Colors.green[500],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ) : Row(
                                            children: [
                                              Container(
                                                alignment:Alignment.center,
                                                child: Icon(
                                                  Icons.money,
                                                  color: Colors.green[500],
                                                ),
                                              ),
                                              Padding(padding: const EdgeInsets.only(left:12.0)),
                                              Text("Cash on Delivery", style: AppFonts.monm),
                                              Spacer(),
                                              Container(
                                                child: Column(
                                                  children: [
                                                    Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Colors.green[500],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 70,
            child: Column(
              children: [
                indicatorshow(indicatorvisible),

                InkWell(
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    width: size.width / 1,
                    color: Colors.green[500],
                    child: Text(
                      'Check Out',
                      style: AppFonts.monmwhit16,
                    ),
                  ),
                  onTap: (){
                    checkout();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkout(){
    if(globalfoodcart.isNotEmpty) {
      if (type == 'food') {
        if (selectpaymenttype == 'cash') {
          API.checkout(
              foodcheckoutAPI,
              userid.toString(),
              newglobalfoodcart[0].vendorid.toString(),
              (double.parse(sales_tax.toString())+double.parse(cartprice.toString())).toString(),
              sales_tax.toString(),
              notecontroller.text.toString(),
              "cod",
              null,
              null,
              null,
              null,
              newglobalfoodcart);
          waitforcheckout();
        }
        else{
          var expiry = credit[
          selectedcardindex == null ? 0
              : int.parse(selectedcardindex)
          ].expiryDate;

          var expiry1 = expiry.split('/');

          API.checkout(
              foodcheckoutAPI,
              userid.toString(),
              newglobalfoodcart[0].vendorid.toString(),
              (double.parse(sales_tax.toString())+double.parse(cartprice.toString())).toString(),
              sales_tax.toString(),
              notecontroller.text.toString(),
              "card",
              credit[
              selectedcardindex == null ? 0
                  : int.parse(selectedcardindex)
              ].cardNumber.toString(),
              expiry1[0].toString(),
              expiry1[1].toString(),
              credit[
              selectedcardindex == null ? 0
                  : int.parse(selectedcardindex)
              ].cvvCode.toString(),
              newglobalfoodcart);
          waitforcheckout();
        }
      }
      else if(type == 'grocery'){
        if (selectpaymenttype == 'cash') {
          API.checkout(
              grocerycheckoutAPI,
              userid.toString(),
              newglobalfoodcart[0].vendorid.toString(),
              (double.parse(sales_tax.toString())+double.parse(cartprice.toString())).toString(),
              sales_tax.toString(),
              notecontroller.text.toString(),
              "cod",
              null,
              null,
              null,
              null,
              newglobalfoodcart);
          waitforcheckout();
        }
        else{
          var expiry = credit[
          selectedcardindex == null ? 0
              : int.parse(selectedcardindex)
          ].expiryDate;

          var expiry1 = expiry.split('/');

          API.checkout(
              grocerycheckoutAPI,
              userid.toString(),
              newglobalfoodcart[0].vendorid.toString(),
              (double.parse(sales_tax.toString())+double.parse(cartprice.toString())).toString(),
              sales_tax.toString(),
              notecontroller.text.toString(),
              "card",
              credit[
              selectedcardindex == null ? 0
                  : int.parse(selectedcardindex)
              ].cardNumber.toString(),
              expiry1[0].toString(),
              expiry1[1].toString(),
              credit[
              selectedcardindex == null ? 0
                  : int.parse(selectedcardindex)
              ].cvvCode.toString(),
              newglobalfoodcart);
          waitforcheckout();
        }
      }
      else if(type == 'store'){
        if (selectpaymenttype == 'cash') {
          API.checkout(
              storecheckoutAPI,
              userid.toString(),
              newglobalfoodcart[0].vendorid.toString(),
              (double.parse(sales_tax.toString())+double.parse(cartprice.toString())).toString(),
              sales_tax.toString(),
              notecontroller.text.toString(),
              "cod",
              null,
              null,
              null,
              null,
              newglobalfoodcart);
          waitforcheckout();
        }
        else{
          var expiry = credit[
          selectedcardindex == null ? 0
              : int.parse(selectedcardindex)
          ].expiryDate;

          var expiry1 = expiry.split('/');

          API.checkout(
              storecheckoutAPI,
              userid.toString(),
              newglobalfoodcart[0].vendorid.toString(),
              (double.parse(sales_tax.toString())+double.parse(cartprice.toString())).toString(),
              sales_tax.toString(),
              notecontroller.text.toString(),
              "card",
              credit[
              selectedcardindex == null ? 0
                  : int.parse(selectedcardindex)
              ].cardNumber.toString(),
              expiry1[0].toString(),
              expiry1[1].toString(),
              credit[
              selectedcardindex == null ? 0
                  : int.parse(selectedcardindex)
              ].cvvCode.toString(),
              newglobalfoodcart);
          waitforcheckout();
        }
      }
    }
  }
}