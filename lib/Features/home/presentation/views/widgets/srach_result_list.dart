import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kamon/Features/home/data/seach_view_model.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SearchViewModel>(context);
    return Positioned(
      top: 80, // Adjust this value as needed
      left: 16,
      right: 16,
      child: Material(
        color: Colors.transparent, // Set Material to transparent
        elevation: 8.0,
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          height: MediaQuery.of(context).size.height -
              100, // Adjust height as needed
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.transparent, // Set container to transparent
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ListView.builder(
            itemCount: viewModel.searchedForEmployees.length,
            itemBuilder: (context, index) {
              final employee = viewModel.searchedForEmployees[index];
              return Card(
                child: ListTile(
                  title: Text(employee.employeeName),
                  subtitle: Text(
                      'Position: ${employee.employeePosition}\nBranch: ${employee.employeeBranch}'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
