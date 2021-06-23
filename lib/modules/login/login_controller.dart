import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/models/user_model.dart';

class LoginController {

  final authController = new AuthController();

  Future<void> googleSignIn(BuildContext context) async {
    try {
      GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: [
          'email',
        ],
      );

      final response  = await _googleSignIn.signIn();
      final user = User(name: response!.displayName!, photoUrl: response.photoUrl);
      
      authController.setUser(context, user);
    } catch (error) {
      print(error);
    }
  }
}