import 'package:flutter/material.dart';
import 'package:recall_de_compras/components/botoon_app_bar.dart';
import 'package:recall_de_compras/pages/login.dart';

class Purchasse extends StatefulWidget {
  const Purchasse({super.key});

  @override
  State<StatefulWidget> createState() => _PurchasseScreen();
}

class _PurchasseScreen extends State<Purchasse> {
  final List<Widget> compras = [];

  Future<void> addCompra() async {
    String? nomeCompra = await _showNameDialog();
    if (nomeCompra != null && nomeCompra.isNotEmpty) {
      setState(() {
        compras.add(Compra(nome: nomeCompra));
        sendMessage(message: 'Compra: $nomeCompra adicionada');
      });
    }
  }

  void sendMessage({required String message}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<String?> _showNameDialog() {
    // box para pegar o nome da compra
    TextEditingController nameController = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Digite o nome da compra'),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: "Nome da compra"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Fecha o diálogo sem retornar valor
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(nameController.text); // Retorna o valor digitado
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Tela de Compras'),
        ),
        backgroundColor: Colors.black38,
      ),
      bottomNavigationBar: const BotoonAppBar(),
      body: Container(
        alignment: Alignment.center,
        color: Colors.white38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NovaCompra(onPressed: addCompra),
            // const NovaCompra(),
            Expanded(
              child: ListView(
                children: compras,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Compra extends StatelessWidget {
  final String nome;
  const Compra({super.key, required this.nome});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.center, // Centraliza horizontalmente
        child: Container(
          width: 100, // Define a largura desejada
          height: 100,
          color: Colors.blueGrey,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Entrando na compra $nome'),
                      duration: const Duration(seconds: 1),
                    ));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: const Icon(Icons.input)),
              Text(
                nome,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class NovaCompra extends StatelessWidget {
  final VoidCallback onPressed;
  const NovaCompra({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blueGrey,
        child: Center(
          child: ElevatedButton(
              onPressed: onPressed, child: const Icon(Icons.add)),
        ),
      ),
    );
  }
}
