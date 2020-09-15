import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:deliveryofservice/class/profissa.dart';
import 'package:deliveryofservice/class/model.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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
      body: Consumer<ProfissaModel>(
        builder: (context, model, child) {
          List<Profissa> profissionais = model.profissas.where((profissa) {
            return profissa.favorito;
          }).toList();
          return profissionais == null
              ? Text(
                  "Nenhum profissional favoritado",
                  style: TextStyle(color: Colors.black),
                )
              : ListView.separated(
                  itemCount: profissionais.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Color(0xFFF2F3F6),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Image.network(profissionais[index].icone),
                            title: Text(profissionais[index].nome),
                            subtitle: Text(profissionais[index].categoria),
                          ),
                          Container(
                            child: Image.network(profissionais[index].imagem),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(profissionais[index].descricao),
                          ),
                          ButtonTheme(
                            child: ButtonBar(
                              children: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    profissionais[index].favorito =
                                        !profissionais[index].favorito;
                                    model.notifyListeners();
                                  },
                                  child: Icon(
                                    profissionais[index].favorito
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: profissionais[index].favorito
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
    );
  }
}
