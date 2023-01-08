class Products {
  String? id;
  final String productname;
  final String brand;
  final List<dynamic> size;
  final String quantity;
  final String price;
  final String description;
  final List<dynamic> productimages;

  Products({
    this.id = '',
    required this.productname,
    required this.brand,
    required this.size,
    required this.quantity,
    required this.price,
    required this.description,
    required this.productimages,
  });

  static Products fromJson(Map<String, dynamic> json) => Products(
        id: json['id'],
        productname: json['productname'],
        brand: json['brand'],
        size: json['size'],
        quantity: json['quantity'],
        price: json['price'],
        description: json['description'],
        productimages: json['productimages'],
      );
}
