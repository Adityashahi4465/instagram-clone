import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:instagram_clone/core/constants/firebase_constants.dart';
import 'package:instagram_clone/core/faliure.dart';
import 'package:instagram_clone/core/typeDef.dart';

import '../../../core/providers/firebase_providers.dart';
import '../../../models/usermodel.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
      auth: ref.watch(firebaseAuthProvider),
      firestore: ref.watch(firestoreProvider));
});

class AuthRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  AuthRepository({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
  })  : _auth = auth,
        _firestore = firestore;

  CollectionReference get _user =>
      _firestore.collection(FirebaseConstants.user);

  FutureEither<UserModel?> signUpWithEmailAndPassword(
      String password, UserModel userModel) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: password,
      );

      final newUserModel = userModel.copyWith(
          profilePic: user.additionalUserInfo?.profile?['picture'].toString(),
          uid: user.user!.uid);

      await _user.doc(newUserModel.uid).set(newUserModel.toMap());

      return right(newUserModel);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
