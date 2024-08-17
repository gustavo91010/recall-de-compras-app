import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Purchasse extends StatefulWidget {
  const Purchasse({super.key});

  @override
  State<StatefulWidget> createState() => _PurchasseScreen();
}

class _PurchasseScreen extends State<Purchasse> {
  final List<Widget> compras = [];

  @override
  void initState() {
    super.initState();
    // adiciona um item a lista
    compras.add(const Compra());
  }

  void addCompra() {
    setState(() {
      compras.add(const Compra());
    });
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
      body: Container(
        alignment: Alignment.center,
        color: Colors.white38,
        child:  Column(
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
  const Compra({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blueGrey,
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
              onPressed: onPressed,
               //{
                //ScaffoldMessenger.of(context).showSnackBar(
                  //  const SnackBar(content: Text('Nova compra adicionada')));
//              },
              child: const Icon(Icons.add)),
        ),
      ),
    );
  }
}
