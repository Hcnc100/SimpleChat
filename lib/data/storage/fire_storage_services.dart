import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FireStorageServices{
    final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

    Future<String> uploadImage(String fileName, String filePath) async {
        final ref = _firebaseStorage.ref().child("imgProfile").child(filePath).child(fileName);
        final uploadTask = await ref.putFile(File(filePath));
        return await uploadTask.ref.getDownloadURL();
    }
}