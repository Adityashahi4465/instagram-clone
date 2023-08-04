import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/snackbar.dart';
import '../../../models/usermodel.dart';
import '../repository/auth_repository.dart';

final pageControllerProvider = StateProvider<PageController>((ref) {
  return PageController();
});

final userProvider = StateProvider<UserModel?>((ref) => null);

final signUpFormDataProvider = StateProvider<UserModel>((ref) {
  return UserModel(
    uid: '',
    fullName: '',
    birthDay: DateTime.now(),
    email: '',
    userName: '',
    followers: [],
    following: [],
    profilePic: '',
    bio: '',
    link: '',
    joinedAt: DateTime.now(),
  );
});

final passwordInputProvider = StateProvider<String?>((ref) {
  return null;
});

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
      authRepository: ref.watch(authRepositoryProvider), ref: ref);
});

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  final Ref _ref;

  AuthController({
    required AuthRepository authRepository,
    required Ref ref,
  })  : _authRepository = authRepository,
        _ref = ref,
        super(false);

  void signUpWithEmailAndPassword(BuildContext context) async {
    state = true;
    final password = _ref.read(passwordInputProvider);
    final userModel = _ref.read(signUpFormDataProvider);
    final result =
        await _authRepository.signUpWithEmailAndPassword(password!, userModel);
    state = false;
    result.fold((l) => showSnackBar(context, l.message), (user) {
      _ref.read(userProvider.notifier).update((state) => user);
      showSnackBar(context, 'Sign Up Successfully');
    });
  }
}
