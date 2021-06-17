import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  FirebaseAuth auth;

  Authentication() {
    FirebaseAuth.instance;
  }
}
