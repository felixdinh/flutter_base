class ProductModel {
  final String name;
  final String category;
  final int quantity;
  const ProductModel(this.name,this.category,this.quantity);

  static List<ProductModel> products  = [
    ProductModel('Milk','Food',10),
    ProductModel('Rice','Clothes',4),
    ProductModel('Pasta','Food',2),
    ProductModel('Steak','Food',1),
    ProductModel('T-Shirt','Clothes',10),
    ProductModel('Jeans','Clothes',41),
    ProductModel('Shirt','Clothes',0),
    ProductModel('Shirt','Clothes',11),
  ];
}