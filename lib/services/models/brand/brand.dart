class Brand {
  String id;
  final String brandname;
  final String brandimage;

  Brand({
    this.id = '',
    required this.brandname,
    required this.brandimage,
  });

  static Brand fromJson(Map<String, dynamic> json) => Brand(
        id: json['id'],
        brandname: json['brandname'],
        brandimage: json['brandimage'],
      );
}
