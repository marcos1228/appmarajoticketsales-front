import 'package:appmarajoticketsales/model/festa.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FestasScreen extends StatelessWidget {
  final List<Festa> festas = [
    Festa(
        nome: 'Festival de Verão',
        local: 'Ponta De Pedras',
        data: DateTime(2024, 7, 12),
        imagem: 'assets/fest/rubi.jpg',
        atracao: 'Lendário Rubi'
    ),
    Festa(
        nome: 'Carnaval',
        local: 'Centro',
        data: DateTime(2024, 2, 20),
        imagem: 'assets/fest/rubi.jpg',
        atracao: ''
    ),
    Festa(
        nome: 'Festa Junina',
        local: 'Parque',
        data: DateTime(2024, 6, 24),
        imagem: 'assets/fest/rubi.jpg',
        atracao: ''
    ),
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
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(festa.imagem),
              ),
              title: Text(festa.nome),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Local: ${festa.local}'),
                  Text('Data: ${DateFormat('dd/MM/yyyy').format(festa.data)}'),
                ],
              ),
              onTap: () {
                _showFestaDetails(context, festa);
              },
            ),
          );
        },
      ),
    );
  }

  void _showFestaDetails(BuildContext context, Festa festa) {
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
                  festa.imagem,
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
                      festa.nome,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Local: ${festa.local}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Data: ${DateFormat('dd/MM/yyyy').format(festa.data)}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    if (festa.atracao.isNotEmpty)
                      Text(
                        'Atração: ${festa.atracao}',
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