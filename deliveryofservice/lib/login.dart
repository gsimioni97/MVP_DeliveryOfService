import 'package:deliveryofservice/navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:deliveryofservice/reset_password.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
  static String usuario = _LoginPageState.username;
  static String senha = _LoginPageState.senha;

  @override
  static void resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  /// Variáveis de animação
  AnimationController _iconAnimationController;
  AnimationController _formAnimationController;
  Animation<double> _iconAnimation;

  /// Variáveis de formulário
  static final TextEditingController _email = new TextEditingController();
  static final TextEditingController _pass = new TextEditingController();

  static String get username => _email.text;
  static String get password => _pass.text;
  static String senha;

  void register(BuildContext context) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: username, password: password);
      final User user = result.user;
      if (user != null) {
        _email.text = '';
        _pass.text = '';
        FirebaseAuthAppNavigator.goToHome(context);
        senha = _pass.text;
      }
    } catch (e) {
      print(e);
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Falha ao criar o registro"),
        backgroundColor: Colors.redAccent,
      ));
    }
  }

  void doLogin(BuildContext context) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: username.trim(), password: password);
      final User user = result.user;

      if (user != null) {
        _pass.text = '';
        FirebaseAuthAppNavigator.goToHome(context);
      }
      print('Logado como: ${user.uid}');
    } catch (e) {
      print("Erro: ${e.toString()}");
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Falha ao realizar o Login"),
        backgroundColor: Colors.redAccent,
      ));
    }
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  Future<Null> _playAnimation() async {
    try {
      await _iconAnimationController.forward().orCancel;
      await _formAnimationController.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    _formAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1000));

    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeOut);

    _iconAnimation.addListener(() => this.setState(() {}));

    _playAnimation();
  }

  @override
  void dispose() {
    _formAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Builder(
            builder: (context) => GestureDetector(
                  onTap: () =>
                      FocusScope.of(context).requestFocus(new FocusNode()),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Form(
                        child: Container(
                          padding:
                              EdgeInsets.only(top: 60, left: 40, right: 40),
                          color: Colors.white,
                          child: ListView(children: <Widget>[
                            SizedBox(
                              width: 128,
                              height: 128,
                              child: Image.asset("assets/app_logo.png"),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: "E-mail",
                                hintText: "Favor inserir um e-mail válido",
                                hintStyle: TextStyle(
                                    color: Colors.black12, fontSize: 13),
                                labelStyle: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                              ),
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _pass,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Senha",
                                hintText:
                                    "Favor inserir uma senha de no mínimo 6 digitos",
                                hintStyle: TextStyle(
                                    color: Colors.black12, fontSize: 13),
                                labelStyle: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                              ),
                              style: TextStyle(fontSize: 20),
                            ),
                            Container(
                              height: 40,
                              alignment: Alignment.centerRight,
                              child: FlatButton(
                                child: Text(
                                  "Recuperar Senha",
                                  textAlign: TextAlign.right,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ResetPasswordPage(),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              height: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [0.3, 1],
                                  colors: [
                                    Color(0xFF454B51),
                                    Color(0xFF181A1C),
                                  ],
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: SizedBox.expand(
                                child: FlatButton(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  onPressed: () {
                                    doLogin(context);
                                    senha = _pass.text;
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              height: 40,
                              child: FlatButton(
                                child: Text(
                                  "Registrar",
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () {
                                  register(context);
                                },
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                )));
  }
}
