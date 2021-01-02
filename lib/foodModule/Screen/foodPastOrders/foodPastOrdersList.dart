import 'package:flutter/material.dart';

import 'foodPastOrdersDetails.dart';
import 'foodPastOrdersCard.dart';

class foodPastOrdersList extends StatefulWidget {
  @override
  _foodPastOrdersListPageState createState() => _foodPastOrdersListPageState();
}

class _foodPastOrdersListPageState extends State<foodPastOrdersList> {
  List<FoodPastOrders> searchResults;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchResults = foodPastOrders;
  }

  @override
  Widget build(BuildContext context) {
    if (foodPastOrders == null) foodPastOrders = [];
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 4.5,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: foodPastOrders.length,
            itemBuilder: (_, index) {
              return FoodPastOrdersCard(
                foodPastOrders: foodPastOrders[index],
              );
            }),
      ),
    );
  }
}
