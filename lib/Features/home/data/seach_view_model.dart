import 'package:flutter/material.dart';
import 'package:kamon/Features/menu/data/get_active_emp.dart';
import 'package:kamon/Features/menu/model/active_emp_model.dart';

class SearchViewModel extends ChangeNotifier {
  final GetActiveEmployee _apiService = GetActiveEmployee();
  List<ActiveEmployeesModel> allEmployees = [];
  List<ActiveEmployeesModel> searchedForEmployees = [];
  bool isLoading = false;

  SearchViewModel() {
    fetchEmployees();
  }

  Future<void> fetchEmployees() async {
    isLoading = true;
    notifyListeners();
    try {
      allEmployees = await _apiService.fetchActiveEmployees();
    } catch (error) {
      // Handle error
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void searchEmployees(String query) {
    if (query.isEmpty) {
      searchedForEmployees = [];
    } else {
      searchedForEmployees = allEmployees
          .where((employee) =>
              employee.employeeName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
