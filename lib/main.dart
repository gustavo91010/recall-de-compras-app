import 'package:flutter/material.dart';
import 'package:recall_de_compras/pages/login.dart';
import 'package:recall_de_compras/pages/purchase_itens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recall de Compras',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     home:  Login()

    );
  }
}


