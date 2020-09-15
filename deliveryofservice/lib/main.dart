import 'package:deliveryofservice/routes.dart';
import 'package:flutter/material.dart';
import 'package:deliveryofservice/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:deliveryofservice/class/model.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      builder: (context) => ProfissaModel(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      title: 'Delivery of Service',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: FirebaseAuthAppRoutes().routes,
    );
  }
}
