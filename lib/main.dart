import 'package:flutter/material.dart';
import 'package:wittravel/states/add_travel.dart';
import 'package:wittravel/states/authen.dart';
import 'package:wittravel/states/create_account.dart';
import 'package:wittravel/states/list_travel.dart';
import 'package:wittravel/utility/my_constant.dart';

Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => const Authen(),
  '/createaccount':(BuildContext context)=>const CreateAccount(),
  '/listtravel':(BuildContext context)=>const ListTravel(),
  '/addtravel':(BuildContext context)=>const AddTravel(),
};

String? firstState;

main(){
  firstState =MyConstant.routeAuthen;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:MyConstant.appname,
      routes: map,
      initialRoute: firstState,
    );
  }
}
