import 'package:flutter/material.dart';
import 'package:appmarajoticketsales/model/festa.model.dart';
import 'package:intl/intl.dart';

class DetalhesFestaScreen extends StatelessWidget {
  final Festa festa;

  DetalhesFestaScreen({required this.festa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(festa.nome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                festa.imagem,
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
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
          ],
        ),
      ),
    );
  }
}
