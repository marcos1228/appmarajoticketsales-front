import 'package:appmarajoticketsales/model/restaurante.model.dart';
import 'package:flutter/material.dart';

class LanchesScreen extends StatelessWidget {
  final List<Restaurante> restaurantes = [
    Restaurante(nome: 'Restaurante Sabor Marajoara', endereco: 'Rua Principal, 123', tipo: 'Restaurante', imagem: 'assets/restaurantes/sabor_marajoara.jpg'),
    Restaurante(nome: 'Lanchonete do João', endereco: 'Avenida Central, 45', tipo: 'Lanchonete', imagem: 'assets/restaurantes/lanchonete_joao.jpg'),
    Restaurante(nome: 'Pizzaria da Ilha', endereco: 'Praça das Flores, 67', tipo: 'Pizzaria', imagem: 'assets/restaurantes/pizzaria_ilha.jpg'),
    Restaurante(nome: 'Churrascaria Boi Gordo', endereco: 'Rua das Mangueiras, 89', tipo: 'Churrascaria', imagem: 'assets/restaurantes/boi_gordo.jpg'),
    Restaurante(nome: 'Sorveteria Gelada', endereco: 'Avenida dos Navegantes, 101', tipo: 'Sorveteria', imagem: 'assets/restaurantes/sorveteria_gelada.jpg'),
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
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(restaurante.imagem),
              ),
              title: Text(restaurante.nome),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Endereço: ${restaurante.endereco}'),
                  Text('Tipo: ${restaurante.tipo}'),
                ],
              ),
              onTap: () {
                _showRestauranteDetails(context, restaurante);
              },
            ),
          );
        },
      ),
    );
  }

  void _showRestauranteDetails(BuildContext context, Restaurante restaurante) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  restaurante.imagem,
                  width: double.maxFinite,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurante.nome,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Endereço: ${restaurante.endereco}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Tipo: ${restaurante.tipo}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Fechar'),
              ),
            ],
          ),
        );
      },
    );
  }
}
