import 'package:connectivity/connectivity.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';
import 'package:geolocator/geolocator.dart';

import 'package:latlong/latlong.dart';
import 'package:norwayfinalcustomer/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Component/Color/color.dart';
import 'firstpage.dart';
import 'global.dart';
class SplashTest extends StatefulWidget {
  static SharedPreferences sharedPreferences;
  static String tok;
  static List<String> toke = new List();

  @override
  _SplashTestState createState() => _SplashTestState();
}

class _SplashTestState extends State<SplashTest> with TickerProviderStateMixin{

  LatLng _center;
  Position currentLocation;
  String _message = '';
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  Widget delay(){
    Future.delayed(
        const Duration(seconds: 5), ()
    {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => Firstpage()));
    });
  }
  initi(){
    SharedPreferences.getInstance().then((prefs) {
      SplashTest.sharedPreferences = prefs;
    });
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    setState(() {
      //_center = LatLng(currentLocation.latitude, currentLocation.longitude);
      getLocationName(currentLocation.latitude, currentLocation.longitude);
    });
    print('center $_center');
  }
  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  void getLocationName(double lat, double lng) async {
    final coordinates = new Coordinates(lat, lng);
    var addresses =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");
    usercurraddr = first.addressLine;
    usercurrlat = lat;
    usercurrlng = lng;
    //_addressTo = first.addressLine;
  }
  _registerOnFirebase() {
    _firebaseMessaging.subscribeToTopic('all');
    _firebaseMessaging.getToken().then((token) => SplashTest.tok = token);
  }
  void getMessage() {
    var platform = Theme.of(context).platform;
    if (platform == TargetPlatform.iOS) {
      _firebaseMessaging
          .requestNotificationPermissions(const IosNotificationSettings(sound: true, badge: true, alert: true));
      _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
        print("Settings registered: $settings");
      });
    }
    else{
      _firebaseMessaging.configure(
          onMessage: (Map<String, dynamic> message) async {
            print('received message');
            setState(() => _message = message["notification"]["body"]);
          }, onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
        setState(() => _message = message["notification"]["body"]);
      }, onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
        setState(() => _message = message["notification"]["body"]);
      });
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    initi();
    checkconnection();
    delay();
    super.initState();

  }
  checkconnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // Mobile is not Connected to Internet
      Fluttertoast.showToast(
          msg: "PLEASE CHECK INTERNET SERVICE",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    else if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      setState(() {
        getUserLocation();
        _registerOnFirebase();
        getMessage();
      });
    }
    else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      setState(() {
        getUserLocation();
        _registerOnFirebase();
        getMessage();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        /// Set Background image in splash screen layout (Click to open code)

        child: Container(
          decoration: BoxDecoration(
              gradient: new LinearGradient(
                  colors: [

                    AppColors.black,
                    Colors.black,
                  ],
                  stops: [0.0, 1.0],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  tileMode: TileMode.repeated
              )
          ),

          child: Center(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/logo-AK-Booker.png',width: 200,height: 200,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}