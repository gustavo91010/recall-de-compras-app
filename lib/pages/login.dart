import 'package:flutter/material.dart';
import 'package:recall_de_compras/components/form_field.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginPageSatte();

  // final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final pass1Controller = TextEditingController();
  final pass2Controller = TextEditingController();
}

class _LoginPageSatte extends State<Login> {
  final formKey = GlobalKey<FormState>(); // Recuperar o estado do formulário,
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final pass1Controller = TextEditingController();
  final pass2Controller = TextEditingController();

  String email = 'bob';
  bool isRegistered = false;
  String emailInput = ''; // Armazena o valor do e-mail digitado

  bool isEmail = true;

  bool isPass1 = false;
  bool isPass2 = false;
  bool isName = false;
  bool isExibirEmail = false;

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    pass1Controller.dispose();
    pass2Controller.dispose();
    super.dispose();
  }

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
            // Form para pegar dados de entrada
            key: formKey, // Para pegar o valor de entrada
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                    visible: isRegistered,
                    child: Text(
                      emailController.text,
                      style: const TextStyle(),
                    )),
                FieldForm(
                  label: 'e-mail',
                  isVisible: isEmail,
                  controller: emailController,
                  // onChanged: (value) {
                  //   // setState(() {
                  //   emailInput = value;
                  //   // });
                  // },
                ),
                Visibility(
                    visible: isName,
                    child: const Text(
                      'Termine seu cadastro:',
                      style: TextStyle(),
                    )),
                FieldForm(
                  label: 'Nome',
                  isVisible: isName,
                  controller: nameController,
                ),
                FieldForm(
                  label: 'senha',
                  isVisible: isPass1 || isName,
                  controller: pass1Controller,
                ),
                FieldForm(
                  label: 'repetir a senha',
                  isVisible: isName,
                  controller: pass2Controller,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      final valid = formKey.currentState?.validate() ?? false;
                      if (valid) {
                        setState(() {
                          isRegistered = emailController.text == email;
                          print(
                              'foi?? $emailController.text true?? $isRegistered');

                          if (isRegistered) {
                            isEmail = !isRegistered;
                            isPass1 = isRegistered;
                            isExibirEmail = isRegistered;
                          } else {
                            isEmail = isRegistered;
                            isName = !isRegistered;
                          }
                        });
                      }
                    },
                    child: const Text('Verificar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
