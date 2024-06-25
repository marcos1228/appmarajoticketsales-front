class Local {
  final String nome;

  Local({required this.nome});
}

class Passagem {
  final Local origem;
  final Local destino;
  final DateTime data;
  final double preco;

  Passagem({
    required this.origem,
    required this.destino,
    required this.data,
    required this.preco,
  });
}
