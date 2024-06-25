import 'dart:convert';

import 'package:appmarajoticketsales/model/viagem.model.dart';
import 'package:http/http.dart' as http;


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
