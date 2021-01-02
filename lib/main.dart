
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:norwayfinalcustomer/firstpage.dart';
import 'package:norwayfinalcustomer/foodReservation/components/Home.dart';
import 'package:norwayfinalcustomer/testSplash.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Saloon/pages/book.dart';
import 'Saloon/pages/home.dart';
import 'Saloon/uidata.dart';
import 'package:firebase_core/firebase_core.dart';
import 'foodReservation/components/MainHome.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static SharedPreferences sharedPreferences;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initi();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    ///Set color status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,//or set color with: Color(0xFF0000FF)
        statusBarIconBrightness: Brightness.dark),
    );


    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      //theme: Constants.lightTheme,
      theme: ThemeData(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          primaryColorLight: Colors.white,
          primaryColorBrightness: Brightness.light,
          primaryColor: Colors.white),

//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//        textTheme: GoogleFonts.reemKufiTextTheme(
//          Theme.of(context).textTheme,
//        ),
//      ),
      home: SplashTest(),

        routes: <String, WidgetBuilder>{
          UIData.homePageRoute: (BuildContext context) => HomePage(),
          UIData.bookPageRoute: (BuildContext context) => BookPage(),
        }
    );
  }
  initi()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }
}
