import 'package:flutter/material.dart';
import 'package:lis/src/modules/searcher/presentation/controllers/searcher_controller.dart';

import 'widgets/employee_card.dart';
import 'widgets/filter.dart';

class EmployersSearchPage extends StatelessWidget {
  const EmployersSearchPage({
    super.key,
    required this.filters,
    required this.controller,
    required this.constraint,
  });

  final List<String> filters;
  final SearcherController controller;
  final BoxConstraints constraint;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Filter(
          filters: filters,
          onFilterSelected: (filter) {},
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: constraint.maxHeight - 188,
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                controller.availableEmployers.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: EmployeeCard(
                    onSeeDetailsPressed: controller.setSelectedEmployee,
                    entity: controller.availableEmployers[index],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
