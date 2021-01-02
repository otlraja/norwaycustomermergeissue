import 'package:flutter/material.dart';
import 'package:norwayfinalcustomer/Component/Color/color.dart';
import 'package:norwayfinalcustomer/Component/Style/style.dart';
import 'package:norwayfinalcustomer/foodModule/Screen/foodcheckout.dart';
import 'package:norwayfinalcustomer/global.dart';
import 'package:progress_dialog/progress_dialog.dart';
import '../API/API.dart';
import 'Signup.dart';




class Loginapi extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Loginapi> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  ProgressDialog pr;


  @override
  void initState() {
    pr = ProgressDialog(context);
    super.initState();
  }



  void waittologin() async {
    await Future.delayed(const Duration(seconds: 1), () {
      if(API.success == 'true'){
        pr.hide();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => FoodCheckout()));
      }
      else if(API.success == 'error'){
        pr.hide();
        // Get.snackbar(
        //   "DELETE",
        //   "The email has already been taken.",
        //   icon: Icon(Icons.delete),
        //   shouldIconPulse: true,
        //   barBlur: 20,
        //   dismissDirection: SnackDismissDirection.HORIZONTAL,
        //   isDismissible: true,
        //   duration: Duration(seconds: 4),
        // );
      }
      else {
        waittologin();
      }

    });

  }


  @override
  Widget build(BuildContext context) {

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10),
      color:Color(0xff2980B9),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if(_formKey.currentState.validate()){
            pr.show();
            API.login(loginAPI,  _emailController.text, _passwordController.text,);
            waittologin();
            //_signInWithEmailAndPassword();
          }
        },
        child: Text("Login",
          textAlign: TextAlign.center,
          style: AppFonts.monm20white,
        ),
      ),
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height:MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [

                      AppColors.silver,
                      Colors.black87,
                    ],
                    stops: [0.0, 1.0],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    tileMode: TileMode.repeated
                )
            ),


            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Container(
                      height:200,
                      width: 200,

                      child: Image.asset('assets/logo1.jpg',width: 200,height: 200,),

                    ),

                    SizedBox(height: 45.0),
                    Container(
                      width: 350,
                      height: 50,
                      child:TextFormField(
                        controller: _emailController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.email, color: AppColors.lightgrey,),
                          filled: true,
                          border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )
                          ),
                          fillColor: Colors.white70,
                          hintText: 'Email',
                          hintStyle: AppFonts.monm12bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      width: 350,
                      height: 50,
                      child:TextFormField(
                        controller: _passwordController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.remove_red_eye, color: AppColors.lightgrey,),
                          filled: true,
                          border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )
                          ),
                          fillColor: Colors.white70,
                          hintText: 'Password',
                          hintStyle: AppFonts.monm12bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        SizedBox(width: 5,),
                        Spacer(),
                        InkWell(
                            child: Text('Forget Password', style: AppFonts.monmwhit12,)
                        ),
                      ],
                    ),


                    SizedBox(
                      height: 15.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                    Center(
                      child: Container(

                        height: 20,
                        width: 200,
                        child: Row(
                          children: [
                            Container(
                              child: Text('Not have an account?'),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) => Signupapi()));
                              },
                              child: Container(
                                child: Text(' Signup',style: TextStyle(fontSize: 15, fontWeight:FontWeight.w500 ),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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