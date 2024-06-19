import 'dart:convert';

// Category model
class Category {
  final int categoryId;
  final String categoryName;
  final String sectionName;
  final String categoryDescription;

  Category({
    required this.categoryId,
    required this.categoryName,
    required this.sectionName,
    required this.categoryDescription,
  });

  // Factory constructor to create a Category from JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['category_id'],
      categoryName: json['category_name'],
      sectionName: json['section_name'],
      categoryDescription: json['category_description'],
    );
  }

  // Method to convert a Category to JSON
  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'category_name': categoryName,
      'section_name': sectionName,
      'category_description': categoryDescription,
    };
  }
}

// Function to parse JSON data to a list of Category objects
List<Category> parseCategories(String jsonResponse) {
  final parsed = json.decode(jsonResponse);
  return parsed['data']
      .map<Category>((json) => Category.fromJson(json))
      .toList();
}
