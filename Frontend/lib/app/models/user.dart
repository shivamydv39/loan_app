class User {
  final String id;
  String name;
  DateTime dob;
  String gender;
  String pan;
  String email;
  String mobile;
  int creditScore;

  User({
    required this.id,
    required this.name,
    required this.dob,
    required this.gender,
    required this.pan,
    required this.email,
    required this.mobile,
    required this.creditScore,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['_id'] ?? '',
    name: json['name'] ?? '',
    dob: DateTime.tryParse(json['dob'] ?? '') ?? DateTime.now(),
    gender: json['gender'] ?? '',
    pan: json['pan'] ?? '',
    email: json['email'] ?? '',
    mobile: json['mobile'] ?? '',
    creditScore: json['creditScore'] ?? 650,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'dob': dob.toIso8601String(),
    'gender': gender,
    'pan': pan,
    'email': email,
    'mobile': mobile,
    'creditScore': creditScore,
  };
}