import 'package:deliveryofservice/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:deliveryofservice/profile.dart';
import 'package:deliveryofservice/favorite.dart';
import 'package:deliveryofservice/class/model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(backgroundColor: Color(0xFF454B51), actions: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 50,
              child: Image.asset("assets/app_logo2.png"),
            ),
          ),
        ]),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF454B51),
              ),
              child: Text(
                'Delivery of Service',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Perfil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favoritos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text('Sair'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
            ),
          ]),
        ),
        body: Consumer<ProfissaModel>(
          builder: (context, model, child) {
            return model.profissas == null
                ? Text("Carregando")
                : ListView.separated(
                    itemCount: model.profissas.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Color(0xFFF2F3F6),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading:
                                  Image.network(model.profissas[index].icone),
                              title: Text(model.profissas[index].nome),
                              subtitle: Text(model.profissas[index].categoria),
                            ),
                            Container(
                              child:
                                  Image.network(model.profissas[index].imagem),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(model.profissas[index].descricao),
                            ),
                            ButtonTheme(
                              child: ButtonBar(
                                children: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      model.profissas[index].favorito =
                                          !model.profissas[index].favorito;
                                      model.notifyListeners();
                                    },
                                    child: Icon(
                                      model.profissas[index].favorito
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: model.profissas[index].favorito
                                          ? Colors.red
                                          : Colors.black38,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
