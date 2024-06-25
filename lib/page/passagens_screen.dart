import 'package:appmarajoticketsales/model/passagem.model.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Passagens'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildDropdownField(
              label: 'Selecione a Origem',
              value: origem,
              items: ['Belém', 'Soure', 'Salvaterra'],
              onChanged: (value) {
                setState(() {
                  origem = value!;
                });
              },
            ),
            SizedBox(height: 16.0),
            _buildDropdownField(
              label: 'Selecione o Destino',
              value: destino,
              items: ['Belém', 'Soure', 'Salvaterra'],
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
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: passagens.length,
                itemBuilder: (context, index) {
                  final passagem = passagens[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${passagem.origem} -> ${passagem.destino}',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          //Text('Data: ${DateFormat('dd/MM/yyyy').format(passagem.data)}'),
                          SizedBox(height: 4.0),
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
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
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
