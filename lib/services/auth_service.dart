part of social_services;

abstract class AuthService {
  // Future<FirebaseUser> signInWithGoogle();
  Future<void> signOut();
  // Future<bool> isSignedIn();
  Future<dynamic> createUserWithEmailAndPassword(SignInDTO signInDTO);
  Future<dynamic> signInWithEmailAndPassword(SignInDTO signInDTO);
  Stream<String> get authenticatedUID;
}

class AuthServiceImpl implements AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  // @override
  // Future<FirebaseUser> signInWithGoogle() async {
  //   final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser.authentication;
  //   final AuthCredential credential = GoogleAuthProvider.getCredential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //   await _firebaseAuth.signInWithCredential(credential);
  //   print((await _firebaseAuth.currentUser()).providerData);
  //   return _firebaseAuth.currentUser();
  // }

  @override
  Future<void> signOut() async {
    return Future.value(
      _firebaseAuth.signOut(),
    );
  }

  @override
  Stream<String> get authenticatedUID {
    return _firebaseAuth
        .authStateChanges()
        .map((event) => event!.uid)
        .asBroadcastStream();
  }

  Future<UserCredential?> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();

    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return Future.value(
          FirebaseAuth.instance.signInWithCredential(credential));
    } else {
      return null;
    }
  }

  @override
  Future<dynamic> signInWithEmailAndPassword(SignInDTO signInDTO) async {
    UserCredential? userCredential;
    try {
      userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: signInDTO.email,
        password: signInDTO.password,
      );
      if (userCredential.user!.emailVerified) {
        return userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return 'Sign in failed';
      }
    }
  }

  @override
  Future<dynamic> createUserWithEmailAndPassword(SignInDTO signInDTO) async {
    UserCredential? userCredential;
    try {
      userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: signInDTO.email,
        password: signInDTO.password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The email account already exists.';
      }
    } catch (e) {
      return 'Account creation failed.';
    }
  }
}
