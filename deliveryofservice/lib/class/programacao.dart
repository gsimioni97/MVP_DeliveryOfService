import 'package:deliveryofservice/class/profissa.dart';

class Programacao {
  List<Profissa> profissas;
  Programacao.fromJson(dynamic json) : profissas = encodeToProfissaList(json);
}

List<Profissa> encodeToProfissaList(List list) {
  List<Profissa> jsonList = List<Profissa>();

  if (list != null) {
    list.map((item) => jsonList.add(Profissa.fromJson(item))).toList();
  }
  return jsonList;
}
