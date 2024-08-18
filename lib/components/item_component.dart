import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.descricao,
    required this.preco,
    required this.marca,
    required this.quantidade,
    required this.unidade,
    required this.medida,
  });

  final String descricao;
  final double preco;
  final String marca;
  final double quantidade;
  final String unidade;
  final double medida;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.brown[100],
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: Colors.brown[300]!,
            width: 2.0,
          ),
        ),
        child: ExpansionTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _buildElement('Desc:', descricao)),
              // Expanded(child: _buildElement('Qnd:', quantidade.toString())),
              Expanded(child: _buildElement('Preço:', preco.toString())),
            ],
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _buildElement('Marca:', marca)),
                // Expanded(child: _buildElement('Medida:', medida.toString())),
                Expanded(child: _buildElement('Unidade:', '$medida $unidade')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildElement(String label, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: Colors.brown[200]!,
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            overflow: TextOverflow
                .ellipsis, // Adiciona reticências se o texto for muito longo
            maxLines: 1,
          ) // Garante que o texto ocupe apenas uma linha),
        ],
      ),
    );
  }
}
