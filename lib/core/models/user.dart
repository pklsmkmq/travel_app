part of 'model.dart';

class User {
    int id;
    String name;
    String email;
    int isVerif;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.isVerif,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        isVerif: json["isVerif"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "isVerif": isVerif,
    };
}