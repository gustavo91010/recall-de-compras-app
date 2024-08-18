
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
          height: 50,
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Text(descricao),
                  ),
                  SizedBox(
                    child: Text(quantidade.toString()),
                  ),
                  SizedBox(
                    child: Text(preco.toString()),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Text(marca),
                  ),
                  SizedBox(
                    child: Text(medida.toString()),
                  ),
                  SizedBox(
                    child: Text(unidade),
                  )
                ],
              )
            ],
          )
          //const Text('Esse vai ser o componente do item'),
          ),
    );
  }
}