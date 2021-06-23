import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app_widget.dart';

void main() => runApp(new AppFirebase());

class AppFirebase extends StatefulWidget {
  const AppFirebase({ Key? key }) : super(key: key);

  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  
    @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return new Material(
            child: new Center(
              child: new Text(
                'Não foi possível inicializar o Firebase',
                textDirection: TextDirection.ltr,
              ),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return new AppWidget();
        }

        return new Material(
          child: new Center(
            child: new CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}