import 'dart:convert';

List<Viagem> welcomeFromJson(String str) => List<Viagem>.from(json.decode(str).map((x) => Viagem.fromJson(x)));

String welcomeToJson(List<Viagem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Viagem {
    String origem;
    String destino;
    DateTime dataViagem;
    String nomeEmbarcacao;

    Viagem({
        required this.origem,
        required this.destino,
        required this.dataViagem,
        required this.nomeEmbarcacao,
    });

    factory Viagem.fromJson(Map<String, dynamic> json) => Viagem(
        origem: json["origem"],
        destino: json["destino"],
        dataViagem: DateTime.parse(json["dataViagem"]),
        nomeEmbarcacao: json["nomeEmbarcacao"],
    );

    Map<String, dynamic> toJson() => {
        "origem": origem,
        "destino": destino,
        "dataViagem": "${dataViagem.year.toString().padLeft(4, '0')}-${dataViagem.month.toString().padLeft(2, '0')}-${dataViagem.day.toString().padLeft(2, '0')}",
        "nomeEmbarcacao": nomeEmbarcacao,
    };
}
