

import 'package:appmarajoticketsales/model/restaurante.model.dart';
import 'package:flutter/material.dart';// Importe o modelo Restaurante

class LanchesScreen extends StatelessWidget {
  final List<Restaurante> restaurantes = [
    Restaurante(nome: 'Restaurante Sabor Marajoara', endereco: 'Rua Principal, 123', tipo: 'Restaurante'),
    Restaurante(nome: 'Lanchonete do João', endereco: 'Avenida Central, 45', tipo: 'Lanchonete'),
    Restaurante(nome: 'Pizzaria da Ilha', endereco: 'Praça das Flores, 67', tipo: 'Pizzaria'),
    Restaurante(nome: 'Churrascaria Boi Gordo', endereco: 'Rua das Mangueiras, 89', tipo: 'Churrascaria'),
    Restaurante(nome: 'Sorveteria Gelada', endereco: 'Avenida dos Navegantes, 101', tipo: 'Sorveteria'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: restaurantes.length,
        itemBuilder: (context, index) {
          final restaurante = restaurantes[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              title: Text(restaurante.nome),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Endereço: ${restaurante.endereco}'),
                  Text('Tipo: ${restaurante.tipo}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
