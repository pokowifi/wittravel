import 'package:flutter/material.dart';

class MyConstant {
  //field
  static String routeAuthen = '/authen';
  static String routeCreateAccount = '/createaccount';
  static String routeListTravel = '/listtravel';
  static String routeAddTravel = '/addtravel';
  static String appname = 'wit travel';

  static Color dart = Color(0xffff3399);

  static String domain ='https://b11b-2001-fb1-10e-f07a-ed7e-8566-1a22-1329.ngrok.io';

  //method
  TextStyle h1style() => TextStyle(
        color: dart,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      );

       TextStyle h2style() => TextStyle(
        color: dart,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      );

       TextStyle h3style() => TextStyle(
        color: dart,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      );
}
