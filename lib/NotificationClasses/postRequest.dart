import 'dart:convert';
import 'package:http/http.dart';
import 'package:norwayfinalcustomer/testSplash.dart';

class postRequest{

  var list = SplashTest.toke;
  var length = SplashTest.toke.length;
  var i = 0;


  //static String bodyt = "dfg";
  //postRequest();

  makePostRequest(String tit , String body , String to)  async{
    // set up POST request arguments
    i++;
    String url = 'https://fcm.googleapis.com/fcm/send';
    Map<String, String> headers = {"Content-type": "application/json" , "Authorization": "key=AAAAOsEeyq0:APA91bEszie2Cx5LhyweQYa1Hqx1LwQAoyXy7tfJBRzuYx79Hz5hbi3Ls3nUZyzmcNVfxX4iOPuUOxB2ixJVMJaX5MTuMq0ynvHh_lCA64DH2UnXv4DE99bKuV2IYpa1R7P1KA1xPwtN"};


    var json = jsonEncode({
      "notification": {"body": body , "title": tit ,  "sound": "default", "color": "#990000",},
      "priority": "high",
      "data": {"clickaction": "FLUTTERNOTIFICATIONCLICK", "id": "1", "status": "done"},
      "to": to,
    });
    //bodyt = "";
    //make POST request

    Response response = await post(url, headers: headers, body: json).whenComplete((){

      if(i<SplashTest.toke.length){
        makePostRequest("post" , "Someone Posted a job" , SplashTest.toke[i]);
      }

    });
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    var bodyt = response.body;
    print(bodyt.toString());
    //setState(() => _message = body);
    // {
    //   "title": "Hello",
    //   "body": "body text",
    //   "userId": 1,
    //   "id": 101
    // }
  }


}