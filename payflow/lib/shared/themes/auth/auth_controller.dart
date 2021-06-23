import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/models/user_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  userModels? _user;

  userModels get user => _user!;

  void setUser(BuildContext context, userModels? user) {
    if (user != null) {
      saveUser(user);
      _user = user;
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      Navigator.pushReplacementNamed(context, "/Login");
    }
  }

  Future<void> saveUser(userModels user) async {
    final instance = await SharedPreferences.getInstance();
    instance.setString("user", user.toJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));
    if (instance.containsKey("user")) {
      final json = instance.getString("user") as String;
      setUser(context, userModels.fromJson(json));
      return;
    } else {
      setUser(context, null);
    }
  }
}
