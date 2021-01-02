import 'package:flutter/material.dart';
//import 'package:quicktask/shop/order/orderDetails.dart';
import 'RidersDetails.dart';
import 'foodNewOrderDetails.dart';
import 'foodNewOrderCard.dart';

class foodNewOrderList extends StatefulWidget {
  @override
  _foodNewOrderListPageState createState() => _foodNewOrderListPageState();
}

class _foodNewOrderListPageState extends State<foodNewOrderList> {
  List<FoodNewOrder> searchResults;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchResults = foodNewOrder;
  }

  @override
  Widget build(BuildContext context) {
    if (foodNewOrder == null) foodNewOrder = [];
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
        child: Container(
          height: MediaQuery.of(context).size.height / 4.5,
          // width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: foodNewOrder.length,
              itemBuilder: (_, index) {
                return InkWell(
                  child: FoodNewOrderCard(
                    foodNewOrder: foodNewOrder[index],
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Ridersdetail()),
                    );
                  },
                );
              }),
        ),

      ),
    );
  }
}
