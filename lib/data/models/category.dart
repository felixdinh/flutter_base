class CategoryModel{
  final String name;

  CategoryModel(this.name);

  static List<CategoryModel> categories = [
    CategoryModel('Clothes'),
    CategoryModel('Food'),
  ];
}