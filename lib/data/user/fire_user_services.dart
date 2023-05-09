import 'package:chat_app/models/auth_data/auth_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireUserServices{
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    Future<void> addUser(AuthData authData) async {
        await _firestore.collection("users").doc(authData.id).set(authData.toJson());
    }

    Future<void> updateUser(AuthData authData) async {
        await _firestore.collection("users").doc(authData.id).update(authData.toJson());
    }

    Future<AuthData> getUser(String id) async {
        final doc = await _firestore.collection("users").doc(id).get();
        return AuthData.fromJson(doc.data()!);
    }
}