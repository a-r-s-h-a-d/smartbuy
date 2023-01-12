class ModelCart {
  String id;
  final String productname;
  final String productimage;
  final String price;
  final String size;
  final int quantity;

  ModelCart({
    this.id = '',
    required this.productname,
    required this.productimage,
    required this.price,
    required this.size,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'productname': productname,
        'productimage': productimage,
        'price': price,
        'size': size,
        'quantity': quantity,
      };

  static ModelCart fromJson(Map<String, dynamic> json) => ModelCart(
        productname: json['productname'],
        productimage: json['productimage'],
        price: json['price'],
        size: json['size'],
        quantity: json['quantity'],
      );
}
