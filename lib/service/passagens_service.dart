import 'dart:convert';

import 'package:appmarajoticketsales/model/viagem.model.dart';
import 'package:http/http.dart' as http;

Future<Viagem> getPassagem() async {
  const url = "https://bookingservice-701bb2c37a37.herokuapp.com/";

  try {
    final response = await http.get(Uri.parse(url));
    
    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200){
      return Viagem.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Falhou ao carregar dados. Status code: ${response.statusCode}");
    }
  } catch (e) {
    print('Erro na requisição: $e');
    throw Exception("Falha na conexão: $e");
  }
}
