import 'package:flutter/material.dart';
import 'package:deliveryofservice/home.dart';
import 'package:deliveryofservice/login.dart';

class FirebaseAuthAppRoutes {
  var routes = <String, WidgetBuilder>{
    "/home": (BuildContext context) => HomePage(),
    "/login": (BuildContext context) => LoginPage(),
  };
}
