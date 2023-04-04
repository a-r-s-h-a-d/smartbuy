class ModelProfile {
  final String id;
  final String name;
  final String email;
  final String dob;
  final String mobilenumber;
  final String profileUrl;

  ModelProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.dob,
    required this.mobilenumber,
    required this.profileUrl,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'dob': dob,
        'mobilenumber': mobilenumber,
        'profileUrl': profileUrl,
      };

  static ModelProfile fromJson(Map<String, dynamic> json) => ModelProfile(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        dob: json['dob'],
        mobilenumber: json['mobilenumber'],
        profileUrl: json['profileUrl'],
      );
}
