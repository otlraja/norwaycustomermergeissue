import 'package:credit_card/credit_card_model.dart';
import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/main.dart';
import 'Models/credit_card_model.dart';
import 'Models/foodvendorsmodel.dart';
import 'Models/productType.dart';
import 'Models/products.dart';
import 'foodModule/MOdel/FoodReviews/foodreviewmodel.dart';
import 'main.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';


Widget indicatorshow(var bool){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Visibility(
      visible: bool,
      child: Align(
          alignment: Alignment.bottomCenter,
          child: LinearProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation(Colors.green),
            minHeight: 4,
          )
      ),
    ),
  );
}


var userid=MyApp.sharedPreferences.getString("userid");
var usertoken=MyApp.sharedPreferences.getString("usertoken");
var username=MyApp.sharedPreferences.getString("username");
var useremail=MyApp.sharedPreferences.getString("useremail");
var userphone=MyApp.sharedPreferences.getString("userphone");

var type = "food";

var baseUrl = "http://akbooker.com/admin/public/api/";

var signupAPI = baseUrl+"signup";
var loginAPI = baseUrl+"login";

var FoodvendorAPI = baseUrl+"foodvendors";
var FoodproductApi = baseUrl+"food/";

var GroceryvendorAPI = baseUrl+"groceryvendors";
var GroceryProductApi = baseUrl+"grocery/";

var StorevendorAPI = baseUrl+"storevendors";
var StoreProductApi = baseUrl+"store/";

var vendorreviewsAPI = baseUrl+"foodvendorreview/";
var groceryvendorreviewsAPI = baseUrl+"groceryvendorreview/";
var storevendorreviewsAPI = baseUrl+"storevendorreview/";

var foodcheckoutAPI = baseUrl+"foodCheckout";
var grocerycheckoutAPI = baseUrl+"groceryCheckout";
var storecheckoutAPI = baseUrl+"storeCheckout";

List<FoodVendors> globalvendors = new List();
List<ProductType> globalproductType = new List();
List<Products> globalproduct = new List();
List<FoodReviewmodel> Foodreview = new List();
List<CreditCardModel> credit = CreditCardModel.decodeMusics(MyApp.sharedPreferences.getString("creditcard"));
List<Products> globalfoodcart = Products.decodeMusics(MyApp.sharedPreferences.getString("foodcart"));
List<Products> newglobalfoodcart = new List();

var vendorname;
var vendoraddress;
var vendorid;
var vendoridcheck;
var sales_tax=1.50;
var deliverytype="AK Bookers Rides";
var selectedcardindex = MyApp.sharedPreferences.getString("selectedcardindex");
var selectpaymenttype = "cash";
var botomvisible=true;
var credircardbuttontex = "Add Card";


var cartprice = double.parse(MyApp.sharedPreferences.getString("cartprice"));