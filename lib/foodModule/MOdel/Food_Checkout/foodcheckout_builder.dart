import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/Models/products.dart';
import 'package:norwayfinalcustomer/global.dart';

import 'foodcheckout_card.dart';
import 'foodheckout_list.dart';

class FoodCheckoutList extends StatefulWidget {
  @override
  _FoodCheckoutListEditPageState createState() =>
      _FoodCheckoutListEditPageState();
}

class _FoodCheckoutListEditPageState extends State<FoodCheckoutList> {
  List<FoodCheckOutt> searchResults;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    getcheckoutlist();
    super.initState();
    searchResults = foodcheckoutt;
  }

  var id = new List();


  void getcheckoutlist(){

    Comparator<Products> priceComparator = (b, a) => a.quantityoncheckout.compareTo(b.quantityoncheckout);
    globalfoodcart = globalfoodcart..sort(priceComparator);
    newglobalfoodcart.clear();
    for(int i = 0; i< globalfoodcart.length; i++){
      if(!id.contains(globalfoodcart[i].id)){
        id.add(globalfoodcart[i].id);
        newglobalfoodcart.add(globalfoodcart[i]);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    if (foodcheckoutt == null) foodcheckoutt = [];
    return
      Container(
        height: MediaQuery.of(context).size.height / 3.35,
        width: MediaQuery.of(context).size.width,
        child: FoodCheckOutCard(
          foodcheckoutt: newglobalfoodcart,
        ),

        // ListView.builder(
        //     scrollDirection: Axis.vertical,
        //     itemCount: globalfoodcart.length,
        //     itemBuilder: (_, index) {
        //       return FoodCheckOutCard(
        //         foodcheckoutt: globalfoodcart[index],
        //       );
        //     }
        //     ),
      );
  }
}