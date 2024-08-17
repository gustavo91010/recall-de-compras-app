import 'package:flutter/material.dart';
import 'package:recall_de_compras/components/botoon_app_bar.dart';
import 'package:recall_de_compras/components/form_field.dart';
import 'package:recall_de_compras/pages/purchasse.dart';

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

  String email = 'bob@email.com';
  bool isRegistered = false;
  String emailInput = ''; // Armazena o valor do e-mail digitado

  bool isEmail = true;

  bool isPass1 = false;
  bool isPass2 = false;
  bool isName = false;
  bool isExibirEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 150,
        title: const Center(
          child: Text('Login'),
        ),
        backgroundColor: Colors.black38,
      ),
      bottomNavigationBar: const BotoonAppBar(),
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
                Visibility(
                    visible: isEmail,
                    child: const Text(
                      'Insira seu email:',
                      style: TextStyle(),
                    )),
                FieldForm(
                  label: 'e-mail',
                  isVisible: isEmail,
                  controller: emailController,
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

                          gerenciamentoDeVizualicacaoForms();
                          flowRegistro(context);

                          flowAutenticacao(context);
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

  void gerenciamentoDeVizualicacaoForms() {
    if (isRegistered) {
      isEmail = !isRegistered;
      isPass1 = isRegistered;
      isExibirEmail = isRegistered;
    } else {
      isEmail = isRegistered;
      isName = !isRegistered;
    }
  }

  void flowRegistro(BuildContext context) {
    if (isName && nameController.text.isNotEmpty) {
      final String senha = pass1Controller.text;
      final String confirmao = pass2Controller.text;
      String message = '';
      if (senha == confirmao) {
        message = 'Cadastro realizado com sucesso';
      } else {
        message = 'Cadastro não realizado';
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 4),
      ));
      //Chama um novo widget:

      if (senha == confirmao) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Purchasse()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      }
    }
  }

  void flowAutenticacao(BuildContext context) {
    if (!isName && pass1Controller.text.isNotEmpty) {
      String message = '';
      if (emailController.text == email) {
        message = 'Autenticação realizada com sucesso';
      } else {
        message = 'Não autorizado';
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 4),
      ));

      if (emailController.text == email) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Purchasse()));
      } else {
        //Chama um novo widget:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      }
    }
  }
}
