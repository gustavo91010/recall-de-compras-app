import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recall_de_compras/pages/login.dart';
import 'package:recall_de_compras/pages/purchasse.dart';

class BotoonAppBar extends StatelessWidget {
  const BotoonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black38,
      shape: const CircularNotchedRectangle(),
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              tooltip: 'Compras',
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Purchasse()),
                );
              },
            ),
            IconButton(
                tooltip: 'Sair',
                icon: const Icon(Icons.exit_to_app),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                })
          ],
        ),
      ),
    );
  }
}
