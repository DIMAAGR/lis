import 'package:flutter/material.dart';
import 'package:lis/src/modules/searcher/domain/employers_entity.dart';
import 'package:lis/src/modules/searcher/mock/employers_mock.dart';

enum SelectedPage { searcher, details, chat }

class SearcherController extends ChangeNotifier {
  final TextEditingController searcherController = TextEditingController();
  final List<String> filters = [];

  List<EmployersEntity> availableEmployers = [
    EmployersEntity.fromJson(joao),
    EmployersEntity.fromJson(maria),
    EmployersEntity.fromJson(pedro),
    EmployersEntity.fromJson(ana),
  ];

  ValueNotifier<EmployersEntity?> selectedEmployee = ValueNotifier(null);
  ValueNotifier<SelectedPage> selectedPage = ValueNotifier(SelectedPage.searcher);

  clear() {
    selectedEmployee.value = null;
    selectedPage.value = SelectedPage.searcher;
  }

  changePage(SelectedPage newPage) => selectedPage.value = newPage;
  setSelectedEmployee(EmployersEntity employee) {
    selectedEmployee.value = employee;
    changePage(SelectedPage.details);
  }
}
