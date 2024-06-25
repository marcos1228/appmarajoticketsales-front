import 'package:appmarajoticketsales/local.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Venda de Passagens - Marajó',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    PassagensScreen(),
    FestasScreen(),
    LanchesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ilha do Marajó'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Ação de notificações
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Ação de perfil
            },
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_boat),
            label: 'Passagens',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.festival),
            label: 'Festas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Lanches',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}

class PassagensScreen extends StatefulWidget {
  @override
  _PassagensScreenState createState() => _PassagensScreenState();
}

class _PassagensScreenState extends State<PassagensScreen> {
  final List<Local> locais = [Local(nome: 'Belém'), Local(nome: 'Soure'), Local(nome: 'Salvaterra')];
  Local? origem;
  Local? destino;
  DateTime data = DateTime.now();
  final List<Passagem> passagens = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DropdownButtonFormField<Local>(
            hint: Text('Selecione a Origem'),
            items: locais.map((local) {
              return DropdownMenuItem<Local>(
                value: local,
                child: Text(local.nome),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                origem = value;
              });
            },
          ),
          SizedBox(height: 16.0),
          DropdownButtonFormField<Local>(
            hint: Text('Selecione o Destino'),
            items: locais.map((local) {
              return DropdownMenuItem<Local>(
                value: local,
                child: Text(local.nome),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                destino = value;
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
                    title: Text('${passagem.origem.nome} -> ${passagem.destino.nome}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       // Text('Data: ${DateFormat('dd/MM/yyyy').format(passagem.data)}'),
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
        origem: origem!,
        destino: destino!,
        data: data,
        preco: 100.0,
      ));
    });
  }
}

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
                //  Text('Data: ${DateFormat('dd/MM/yyyy').format(festa.data)}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

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

class Festa {
  final String nome;
  final String local;
  final DateTime data;

  Festa({required this.nome, required this.local, required this.data});
}

class Restaurante {
  final String nome;
  final String endereco;
  final String tipo;

  Restaurante({required this.nome, required this.endereco, required this.tipo});
}
