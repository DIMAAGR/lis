import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  const Filter({super.key, required this.filters, required this.onFilterSelected});

  final List<String> filters;
  final void Function(String filter) onFilterSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Filtros:'),
        const SizedBox(height: 8),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 160,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: ElevatedButton(
                        onPressed: () => onFilterSelected(filters[index]),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          maximumSize: const Size(128, 32),
                          minimumSize: const Size(64, 32),
                        ),
                        child: Text(
                          filters[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list)),
          ],
        ),
      ],
    );
  }
}
