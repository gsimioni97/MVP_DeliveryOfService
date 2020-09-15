class Profissa {
  String nome;
  String categoria;
  final String icone;
  bool favorito;
  final String imagem;
  String descricao;

  Profissa.fromJson(Map<String, dynamic> json)
      : nome = json['nome'],
        categoria = json['categoria'],
        icone = json['icone'],
        favorito = json['favorito'],
        imagem = json['imagem'],
        descricao = json['descricao'];
}
