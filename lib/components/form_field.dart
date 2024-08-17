import 'package:flutter/material.dart';

class FieldForm extends StatelessWidget {
  final String label;
  final bool isVisible;
  final TextEditingController? controller;

  const FieldForm({
    super.key,
    required this.label,
    required this.isVisible,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return isVisible
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                // tive que por o textform dentro de um sizebox para determinar um comprimento maximo a ele
                width: 400,

                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: label,
                    labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'O campo $label não pode estar vazio';
                    }
                    return null;
                  },
                ),
              ),
            ),
          )
        : const SizedBox.shrink(); // Retorna um widget vazio quando não visível
  }
}
