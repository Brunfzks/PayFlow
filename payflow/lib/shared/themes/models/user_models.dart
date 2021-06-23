import 'dart:convert';

class userModels {
  final String name;
  final String? photoURL;

  userModels({required this.name, this.photoURL});

  Map<String, dynamic> toMap() => {
        "name": name,
        "photoURL": photoURL,
      };

  toJson() => jsonEncode(toMap());

  factory userModels.fromMap(Map<String, dynamic> map) {
    return userModels(name: map['name'], photoURL: map['photoURL']);
  }

  factory userModels.fromJson(String json) =>
      userModels.fromMap(jsonDecode(json));
}
