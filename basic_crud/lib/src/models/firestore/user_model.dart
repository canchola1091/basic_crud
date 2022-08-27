
class UserModel {
  String id;
  final String name;
  final int age;
  final String email;
  final String phone;

  UserModel({
    this.id = '',
    required this.name,
    required this.age,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "age": age,
    "email": email,
    "phone": phone
  };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["name"],
    age: json["age"],
    email: json["email"],
    phone: json["phone"]
  );

}