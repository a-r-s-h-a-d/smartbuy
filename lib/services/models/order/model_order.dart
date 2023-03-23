class ModelOrder {
  final String orderid;
  final String userEmail;
  final String customername;
  final String address;
  final String ordertime;
  final String productname;
  final String productimage;
  final String size;
  final String quantity;
  final String price;
  final int orderstatus;
  final String paymentStatus;
  final bool isDelivered;
  final bool isCancelled;

  ModelOrder({
    required this.orderid,
    this.isCancelled = false,
    this.isDelivered = false,
    required this.customername,
    required this.userEmail,
    required this.address,
    required this.ordertime,
    required this.productname,
    required this.productimage,
    required this.size,
    required this.quantity,
    required this.price,
    required this.orderstatus,
    required this.paymentStatus,
  });

  Map<String, dynamic> toJson() => {
        'orderid': orderid,
        'customername': customername,
        'userEmail': userEmail,
        'address': address,
        'ordertime': ordertime,
        'productname': productname,
        'productimage': productimage,
        'size': size,
        'quantity': quantity,
        'price': price,
        'orderstatus': orderstatus,
        'paymentmethod': paymentStatus,
        'isCancelled': isCancelled,
      };

  static ModelOrder fromJson(Map<String, dynamic> json) => ModelOrder(
        orderid: json['orderid'],
        customername: json['customername'],
        userEmail: json['userEmail'],
        address: json['address'],
        ordertime: json['ordertime'],
        productname: json['productname'],
        productimage: json['productimage'],
        size: json['size'],
        quantity: json['quantity'],
        price: json['price'],
        orderstatus: json['orderstatus'],
        paymentStatus: json['paymentmethod'],
        isCancelled: json['isCancelled'],
      );
}
