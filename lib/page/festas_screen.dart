// pages/festas_screen.dart

import 'package:appmarajoticketsales/model/festa.model.dart';
import 'package:flutter/material.dart';
 // Importe o modelo Festa

class FestasScreen extends StatelessWidget {
  final List<Festa> festas = [
    Festa(nome: 'Festival de Verão', local: 'Praia Grande', data: DateTime(2024, 7, 15)),
    Festa(nome: 'Carnaval', local: 'Centro', data: DateTime(2024, 2, 20)),
    Festa(nome: 'Festa Junina', local: 'Parque', data: DateTime(2024, 6, 24)),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: festas.length,
        itemBuilder: (context, index) {
          final festa = festas[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              title: Text(festa.nome),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Local: ${festa.local}'),
                  //Text('Data: ${DateFormat('dd/MM/yyyy').format(festa.data)}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}