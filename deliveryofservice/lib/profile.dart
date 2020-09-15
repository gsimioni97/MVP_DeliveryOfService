import 'package:flutter/material.dart';
import 'package:deliveryofservice/login.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Form(
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 40, right: 40),
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                alignment: Alignment(0.0, 1.15),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: AssetImage("assets/profile-picture.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: Container(
                  height: 56,
                  width: 56,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.3, 1.0],
                      colors: [
                        Color(0xFF454B51),
                        Color(0xFF181A1C),
                      ],
                    ),
                    border: Border.all(
                      width: 4.0,
                      color: const Color(0xFFFFFFFF),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(56),
                    ),
                  ),
                  child: SizedBox.expand(
                    child: Icon(
                      Icons.assignment_ind,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Center(
                  child: Column(
                children: [
                  Text(
                    "E-mail:",
                    style: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    LoginPage.usuario,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black12,
                    ),
                  ),
                ],
              )),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Column(
                children: [
                  Text(
                    "Senha:",
                    style: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    LoginPage.senha,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black12,
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
