import 'package:flutter/material.dart';

class FieldForm extends StatelessWidget {
  final String label;
  final bool isVisible;
  final TextEditingController? controller;
  // final void Function(String)? onChanged;

  const FieldForm({
    super.key,
    required this.label,
    required this.isVisible,
    // this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return isVisible
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              // onChanged: onChanged,
              // Remover a validação de onChanged
            ),
          )
        : const SizedBox.shrink(); // Retorna um widget vazio quando não visível
  }
}
