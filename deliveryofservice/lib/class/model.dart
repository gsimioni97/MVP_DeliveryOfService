import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:deliveryofservice/class/profissa.dart';
import 'package:deliveryofservice/class/programacao.dart';

class ProfissaModel extends ChangeNotifier {
  List<Profissa> profissas;
  ProfissaModel() {
    if (profissas == null) {
      loadProfissas();
    }
  }

  loadProfissas() async {
    String jsonText =
        await rootBundle.loadString('assets/json/programacao.json');

    dynamic dyn = jsonDecode(jsonText);
    Programacao programacao = Programacao.fromJson(dyn);
    profissas = programacao.profissas;
    notifyListeners();
  }
}
