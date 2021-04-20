import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Banco {
  FirebaseFirestore db;

  Banco() {
    db = FirebaseFirestore.instance;
  }
}
