import 'package:flutter/material.dart';

class SearcherFormField extends StatelessWidget {
  const SearcherFormField({
    super.key,
    required this.controller,
    this.onChanged,
    this.onSaved,
  });

  final TextEditingController controller;
  final void Function(String? value)? onChanged;
  final void Function(String? value)? onSaved;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 320,
      child: TextFormField(
        onChanged: onChanged,
        onSaved: onSaved,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          hintText: 'Busque aqui...',
          prefixIcon: const Icon(Icons.search, size: 28),
          fillColor: Colors.grey[300],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
