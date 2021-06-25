import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  User? _user;

  User get user => _user!;

  void setUser(BuildContext context, User? user) {
    if (user != null) {
      saveUser(user);
      _user = user;
      Navigator.of(context).pushReplacementNamed('/home', arguments: user);
      return;
    }

    Navigator.of(context).pushReplacementNamed('/login');
  }

  Future<void> saveUser(User user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString('user', user.toJson());

    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();

    await Future.delayed(new Duration(seconds: 2));
    if (instance.containsKey('user')) {
      final user = instance.getString('user') as String;
      setUser(context, User.fromJson(user));
      return;
    }

    setUser(context, null);
    return;
  }
}