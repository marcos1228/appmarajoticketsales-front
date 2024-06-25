class Viagem {
  final String origem;
  final String destino;
  final DateTime dataViagem;
  final String nomeEmbarcacao;

  Viagem({
    required this.origem,
    required this.destino,
    required this.dataViagem,
    required this.nomeEmbarcacao,
  });

  factory Viagem.fromJson(Map<String, dynamic> json) {
    return Viagem(
      origem: json['origem'],
      destino: json['destino'],
      dataViagem: DateTime.parse(json['dataViagem']),
      nomeEmbarcacao: json['nomeEmbarcacao'],
    );
  }
}