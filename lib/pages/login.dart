import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginPageSatte();
}

class _LoginPageSatte extends State<Login> {
  final formKey = GlobalKey<FormState>(); // refcuperar o estado do formulario
  String email = 'bob@email.com';
  bool isRegistered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 150,
        title: const Text('login'),
        backgroundColor: Colors.black38,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white38,
          child: Form(
            // form para pegar dados de entrada
            key: formKey, // Para pegar o valor de entrada
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                formulario(
                  label: 'e-mail',
                  isVisible: true,
                  onChanged: (value){
                    print('esse é o valor do form né? $value');
                    setState(() {
                      isRegistered= value == email;
                    });
                  },
                ),






                formulario(label: 'senha', isVisible: isRegistered),
                formulario(label: 'repetir a senha', isVisible: isRegistered),
                formulario(label: 'Nome', isVisible: isRegistered),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      onPressed: () {
                        final valid = formKey.currentState?.validate() ?? false;
                        if (valid) {
                          print('Email digitado foi $valid e o formky é $formKey');

                          // faz a validação se o email esta cadastrado
                          setState(() {});
                        }
                      },
                      child: const Text('Verificar')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class formulario extends StatelessWidget {
  final String label;
  final bool isVisible;
  final void Function(String)? onChanged;

  const formulario({
    super.key,
    required this.label,
    required this.isVisible,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return isVisible
        ? TextFormField(
            decoration: InputDecoration(
                labelText: label,
                labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  // borderSide: BorderSide.none
                )),
            onChanged: onChanged,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo $label é obrigatório';
              }
              print('entrada do campo $label é: $value');
              return null;
            },
          )
        : const SizedBox.shrink(); // Retorna um widget vazio quando não visível
  }
}
