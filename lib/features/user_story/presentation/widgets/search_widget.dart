import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  static const String routeName = 'SearchWidget';

  final String initialValue;
  final void Function(String)? onChanged;

  const SearchWidget({super.key, required this.onChanged, required this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0, // Controla la intensidad de la sombra
      shadowColor: Colors.black.withValues(alpha: 0.5),
      borderRadius: BorderRadius.circular(10),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        decoration: const InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
