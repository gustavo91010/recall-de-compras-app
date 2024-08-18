import 'package:flutter/material.dart';
import 'package:recall_de_compras/components/botoon_app_bar.dart';
import 'package:recall_de_compras/components/item_component.dart';

class PurchaseItens extends StatefulWidget {
  const PurchaseItens({super.key});

  @override
  State<StatefulWidget> createState() => _PurchaseItensScreen();
}

class _PurchaseItensScreen extends State<PurchaseItens> {
  final List<Item> itens = [];

  Future<void> addItem() async {
    final result = await _insertItem(context);
    if (result != null) {
      setState(() {
        itens.add(result);
      });
    }
  }

  final String descricao = 'Macarrão';
  final String marca = 'Vitarela';
  final double preco = 4.79;
  final String unidade = 'g';
  final double medida = 500;
  final double qnd = 23;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Nome da compra'),
        ),
        backgroundColor: Colors.black38,
      ),
      bottomNavigationBar: const BotoonAppBar(),
      body: Column(
        children: [
          totalCompra(),
          ElevatedButton(
            onPressed: addItem, // Chama o método para adicionar um novo item
            child: const Text('Adicionar Novo Item'),
          ),
          Expanded(
            child: ListView(
              children: itens,
            ),
          ),
        ],
      ),
    );
  }

  Padding totalCompra() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          width: 200,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          child: const Text('total da compra'),
        ),
      ),
    );
  }

  Future<Item?> _insertItem(BuildContext context) {
    TextEditingController descriptionController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController brandController = TextEditingController();
    TextEditingController unitController = TextEditingController();
    TextEditingController quantityController = TextEditingController();

    return showDialog<Item>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Digite os novos valores'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(hintText: "Descrição"),
                ),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(hintText: "Preço"),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: brandController,
                  decoration: const InputDecoration(hintText: "Marca"),
                ),
                TextField(
                  controller: unitController,
                  decoration: const InputDecoration(hintText: "Unidade"),
                ),
                TextField(
                  controller: quantityController,
                  decoration: const InputDecoration(hintText: "Quantidade"),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
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
                final newItem = Item(
                  descricao: descriptionController.text,
                  preco: double.tryParse(priceController.text) ?? 0.0,
                  marca: brandController.text,
                  quantidade: double.tryParse(quantityController.text) ?? 0.0,
                  medida: double.tryParse(quantityController.text) ?? 0.0,
                  unidade: unitController.text,
                );
                Navigator.of(context).pop(newItem); // Retorna o novo item
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
