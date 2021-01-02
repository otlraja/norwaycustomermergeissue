import 'package:dio/dio.dart';
import 'package:norwayfinalcustomer/Models/foodvendorsmodel.dart';
import 'package:norwayfinalcustomer/Models/products.dart';
import 'package:norwayfinalcustomer/foodModule/MOdel/FoodReviews/foodreviewmodel.dart';
import '../global.dart';
import '../Models/productType.dart';
import '../main.dart';
class API{
  static var success = "false";
  static var items1;


  static checkout(var url, var userId, var vendorId, var totalPrice, var tax, var instruction,
      var paymentMethod, var cardNumber, var expiryMonth,var expiryYear,var cvc, var items){

    items1 = new List();
    items1 = items;
    success = "false";
    Dio dio = new Dio();

    FormData formData = new FormData.fromMap({
      'user_id': userId,
      'total_price': totalPrice,
      'tax': tax,
      'instruction': instruction,
      'payment_method': paymentMethod,
      'card_number': cardNumber,
      'expiry_month': expiryMonth,
      'expiry_year': expiryYear,
      'cvc': cvc,
      'items': Products.encodeMusics(newglobalfoodcart),
      'vendor_id': vendorId,
    });
    dio.post(url, data: formData,options: Options(
      contentType: "application/json",
    ),
    ).then((response) {
      //Map<String, dynamic> data = response.data;
      success = "true";
      //print(response.data);
    }).catchError(_handleDioErrorsignup);
  }


  static login(var url, var email, var pass,){
    success = "false";
    Dio dio = new Dio();

    FormData formData = new FormData.fromMap({
      'email': email,
      'password': pass,
    });
    dio.post(url, data: formData,options: Options(
      contentType: "application/json",
      // headers: {
      //   "Content-Type": " application/json"
      // },
    ),
    ).then((response){

      Map<String, dynamic> data = response.data;
      var status = data['success'];

      if(response.statusCode == 200){
        if(status != null){
          usertoken = data['success']['token'];

          var user = data['success']['user']['detail'];
          username = user['user_name'];
          useremail = user['email'];
          userid = user['user_id'].toString();
          userphone = user['phone'];
          MyApp.sharedPreferences.setString("usertoken", usertoken.toString());
          MyApp.sharedPreferences.setString("username", username.toString());
          MyApp.sharedPreferences.setString("useremail", useremail.toString());
          MyApp.sharedPreferences.setString("userid", userid.toString());
          MyApp.sharedPreferences.setString("userphone", userphone.toString());

          success = "true";
          print('done');
        }
        else{
          success = "error";
          print('error');
        }
      }
      else{
        success = "error";
        throw Exception('Failed to Fetch Vendors');
      }
    }).catchError(_handleDioErrorsignup);

  }


  static signup(var url, var name, var email, var pass, var phone){
    success = "false";
    Dio dio = new Dio();
    //dio.options.headers['Content-Type'] = 'application/json';
    //dio.options.headers["authorization"] = "token ${token}";
    FormData formData = new FormData.fromMap({
      'name': name,
      'phone': phone,
      'email': email,
      'password': pass,
    });
    dio.post(url, data: formData,options: Options(
      contentType: "application/json",
    ),
    ).then((response){
      Map<String, dynamic> data = response.data;
      var status = data['success'];

      if(response.statusCode == 200){
        if(status != null){
          success = "true";
          print('done');
        }
        else{
          success = "error";
          print('error');
        }
      }
      else{
        success = "error";
        throw Exception('Failed to Fetch Vendors');
      }
    }).catchError(_handleDioErrorsignup);
  }

  static allfoodvendors(var vendorUrl){
    success = "false";
    globalvendors.clear();
    Dio dio = new Dio();
    dio.get(vendorUrl).then((response){
      if(response.statusCode == 200){
        Map<String, dynamic> data = response.data;
        var records = data['success']['records'];
        for(Map i in records){
          if(i['detail']['status'] == 1){
            globalvendors.add(
                FoodVendors(
                  id: i['id'],
                  image: i['detail']["image"],
                  name: i['name'],
                  address: i['detail']['address'],
                  totalReviews: i['totalReviews'],
                  avgRating: i['avgRating'],
                )
            );
          }
        }
        success = "true";
      }
      else{
        success = "true";
        throw Exception('Failed to Fetch Vendors');
      }
    });
  }

  static vendorProducts(var vendorUrl) async {
    print(vendorUrl);
    success = "false";
    Dio dio = new Dio();
    globalproductType.clear();
    dio.get(vendorUrl).then((response){
      globalproductType.clear();
      if(response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        if(data['error'] != null ){
          success = 'true';
        }
        else{
          var records = data['success']['records'];
          var vendorid = data['success']['shop']['id'];
          var vendorname = data['success']['shop']['name'];



          for(Map i in records){
            globalproduct = new List();
            for(Map j in i['products']){
              globalproduct.add(
                  Products(
                    id: j['id'],
                    name: j['name'],
                    image: j['image'],
                    price: j['price'],
                    quantity: j['quantity'],
                    orderquantity: 0,
                    vendorid: vendorid,
                    vendorname: vendorname,
                  )
              );
            }
            globalproductType.add(
                ProductType(
                  name: i['name'],
                  id: i['id'],
                  product: globalproduct,
                  vendorId: vendorid.toString(),
                  vendorname: vendorname,
                )
            );
          }
        }

        success = "true";
      }
      else{
        success = "true";
        throw Exception('Failed to Fetch Vendors Products');
      }
    }).catchError(_handleDioError);
  }

  static vendorreviews(var vendorUrl) async {
    print(vendorUrl);
    success = "false";
    Dio dio = new Dio();
    Foodreview.clear();
    dio.get(vendorUrl).then((response) {
      Foodreview.clear();
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        var records = data['success']['records'];
        for(Map i in records){
          // var name;
          // for(Map j in i['user']){
          //   name = j["name"];
          // }
          Foodreview.add(
              FoodReviewmodel(

                name: i['user']['name'],
                date: i['created_at'],
                message: i['reviews'],
                rate: i['rating'],
              )
          );
        }
        success = "true";
      }
      else{
        success = "true";
        throw Exception('Failed to Fetch Vendors Products');
      }
    }).catchError(_handleDioError);
  }

  static _handleDioError(dynamic error){
    success = "true";
    throw Exception('Failed to Fetch Vendors Products');
  }

  static _handleDioErrorsignup(dynamic error){
    success = "error";
    throw Exception('Failed to Fetch Vendors Products');
  }
}