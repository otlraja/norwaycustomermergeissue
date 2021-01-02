import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Style/style.dart';

import '../../../global.dart';
import 'foodreviewmodel.dart';

class FoodReviewCard extends StatefulWidget {
  final FoodReviewmodel foodreview;
  final int ind;

  const FoodReviewCard({Key key, this.ind, this.foodreview}) : super(key: key);
  @override
  FoodReviewCards createState() => FoodReviewCards(this.foodreview,this.ind);
}

class FoodReviewCards extends State<FoodReviewCard> {
  final FoodReviewmodel foodreview;
  final int ind;
  @override
  void initState() {
    // TODO: implement initState

    // img(image);

    super.initState();
    //img(image);
  }

  FoodReviewCards(this.foodreview,this.ind);
  String img(image) {
    return image;
  }

//  Function ontap(){
//    Navigator.of(context).push(MaterialPageRoute(builder:(_)=>check()));
//  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              Foodreview[ind].name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  width: 25,
                  child: IconButton(
                    icon: Icon(
                      Icons.star,
                      color: Color(0xFFFCD800),
                      size: 15,
                    ),
                    onPressed: (){},
                  ),
                ),
              ),
              Container(
                  child: Text(
                    Foodreview[ind].rate.toString(),
                    style: AppFonts.monmyellow,
                  )),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Text(
                  Foodreview[ind].date.toString(),
                  style: AppFonts.monmgrey,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              Foodreview[ind].message,
              style: AppFonts.monm,
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}