import 'package:flutter/material.dart';
import 'package:recall_de_compras/components/botoon_app_bar.dart';
import 'package:recall_de_compras/components/item_component.dart';

class PurchaseItens extends StatefulWidget {
  const PurchaseItens({super.key});

  @override
  State<StatefulWidget> createState() => _PurchaseItensScreen();
}

class _PurchaseItensScreen extends State<PurchaseItens> {
  final String descricao = 'Macarrão';
  final String marca = 'Vitarela';
  final double preco = 4.79;
  final String unidade = 'g';
  final double quantidade = 500;

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
          Expanded(
            child: ListView(
              children: [
                Item(
                    descricao: descricao,
                    preco: preco,
                    marca: marca,
                    quantidade: quantidade,
                    unidade: unidade),
                const Item(
                    descricao: 'Coca Cola',
                    preco: 7.25,
                    marca: 'Coca Cola',
                    quantidade: 2,
                    unidade: 'l'),
                const Item(
                    descricao: 'Linha de costura',
                    preco: 1.20,
                    marca: 'linha forte',
                    quantidade: 100,
                    unidade: 'm'),
                const Item(
                    descricao: 'Leite em pó',
                    preco: 6.25,
                    marca: 'camponesa',
                    quantidade: 200,
                    unidade: 'g')
              ],
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
}

