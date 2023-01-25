class ModelAddress {
  String id;
  final String fullname;
  final String phoneNumber;
  final String pincode;
  final String state;
  final String city;
  final String housenoorbuildingname;
  final String roadareacolony;

  ModelAddress({
    this.id = '',
    required this.fullname,
    required this.phoneNumber,
    required this.pincode,
    required this.state,
    required this.city,
    required this.housenoorbuildingname,
    required this.roadareacolony,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullname': fullname,
        'phoneNumber': phoneNumber,
        'pincode': pincode,
        'state': state,
        'city': city,
        'housenoorbuildingname': housenoorbuildingname,
        'roadareacolony': roadareacolony,
      };

  static ModelAddress fromJson(Map<String, dynamic> json) => ModelAddress(
        fullname: json['fullname'],
        phoneNumber: json['phoneNumber'],
        pincode: json['pincode'],
        state: json['state'],
        city: json['city'],
        housenoorbuildingname: json['housenoorbuildingname'],
        roadareacolony: json['roadareacolony'],
      );
}
