import 'package:chat_app/models/api/register_dto.dart';
import 'package:chat_app/models/auth_data/auth_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireUserServices{
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    Future<void> addUser(RegisterDTO registerDTO) async {
        await _firestore.collection("users").doc(registerDTO.id).set(registerDTO.toJsonFirebase( ));
    }

    Future<void> updateUser(RegisterDTO registerDTO) async {
        await _firestore.collection("users").doc(registerDTO.id).update(registerDTO.toJsonFirebase());
    }

    Future<AuthData> getUser(String id) async {
        final doc = await _firestore.collection("users").doc(id).get();
        return AuthData.fromJson(doc.data()!);
    }
}