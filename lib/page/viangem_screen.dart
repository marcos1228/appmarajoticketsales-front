import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViagemScreen extends StatefulWidget {
  @override
  _ViagemScreenState createState() => _ViagemScreenState();
}

class _ViagemScreenState extends State<ViagemScreen> {
  late http.Client _client;
  late List<Viagem> _viagens;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _client = http.Client();
    _viagens = [];
  }

  @override
  void dispose() {
    _client.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes das Viagens'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _viagens.isEmpty
              ? Center(child: Text('Nenhuma viagem encontrada.'))
              : ListView.builder(
                  itemCount: _viagens.length,
                  itemBuilder: (context, index) {
                    Viagem viagem = _viagens[index];
                    return ListTile(
                      title: Text('Origem: ${viagem.origem}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Destino: ${viagem.destino}'),
                          Text('Data: ${viagem.dataViagem}'),
                          Text('Nome da Embarcação: ${viagem.nomeEmbarcacao}'),
                        ],
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            _isLoading = true;
          });
          try {
            List<Viagem> viagens = await fetchViagens(); // Chama a função assíncrona aqui
            setState(() {
              _viagens = viagens;
              _isLoading = false;
            });
          } catch (e) {
            setState(() {
              _isLoading = false;
            });
            print('Erro na requisição: $e');
          }
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  Future<List<Viagem>> fetchViagens() async {
    const url = 'https://bookingservice-701bb2c37a37.herokuapp.com/'; // URL da API
    try {
      var response = await _client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body) as List<dynamic>;
        List<Viagem> viagens = jsonData.map((json) => Viagem.fromJson(json)).toList();
        return viagens;
      } else {
        throw Exception('Falha ao carregar dados. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Falha na conexão: $e');
    }
  }
}

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
