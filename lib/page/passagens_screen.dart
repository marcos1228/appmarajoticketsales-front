// pages/passagens_screen.dart

import 'package:appmarajoticketsales/model/passagem.model.dart';
import 'package:flutter/material.dart';
 // Importe o modelo Passagem

class PassagensScreen extends StatefulWidget {
  @override
  _PassagensScreenState createState() => _PassagensScreenState();
}

class _PassagensScreenState extends State<PassagensScreen> {
  String origem = 'Belém'; // Origem inicial
  String destino = 'Soure'; // Destino inicial
  DateTime data = DateTime.now();
  List<Passagem> passagens = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            value: origem,
            hint: Text('Selecione a Origem'),
            items: ['Belém', 'Soure', 'Salvaterra'].map((local) {
              return DropdownMenuItem<String>(
                value: local,
                child: Text(local),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                origem = value!;
              });
            },
          ),
          SizedBox(height: 16.0),
          DropdownButtonFormField<String>(
            value: destino,
            hint: Text('Selecione o Destino'),
            items: ['Belém', 'Soure', 'Salvaterra'].map((local) {
              return DropdownMenuItem<String>(
                value: local,
                child: Text(local),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                destino = value!;
              });
            },
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () async {
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: data,
                firstDate: DateTime.now(),
                lastDate: DateTime(2101),
              );
              if (selectedDate != null && selectedDate != data) {
                setState(() {
                  data = selectedDate;
                });
              }
            },
            child: Text('Selecione a Data'),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _buscarPassagens,
            child: Text('Buscar Passagens'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: passagens.length,
              itemBuilder: (context, index) {
                final passagem = passagens[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16.0),
                    title: Text('${passagem.origem} -> ${passagem.destino}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Text('Data: ${DateFormat('dd/MM/yyyy').format(passagem.data)}'),
                        Text('Preço: R\$ ${passagem.preco.toStringAsFixed(2)}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _buscarPassagens() {
    setState(() {
      passagens.clear();
      passagens.add(Passagem(
        origem: origem,
        destino: destino,
        data: data,
        preco: 100.0,
      ));
    });
  }
}