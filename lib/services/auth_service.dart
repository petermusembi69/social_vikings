part of social_services;

abstract class AuthService {
  Future<dynamic> signInWithGoogle();
  Future<void> signOut();
  Future<dynamic> createUserWithEmailAndPassword(SignInDTO signInDTO);
  Future<dynamic> signInWithEmailAndPassword(SignInDTO signInDTO);
}

class AuthServiceImpl implements AuthService {
  final _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<dynamic> signInWithGoogle() async {
    final googleSignInAccount = await _googleSignIn.signIn();
    final googleSignInAuthentication =
        await googleSignInAccount?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication?.idToken,
      accessToken: googleSignInAuthentication?.accessToken,
    );

    final authResult = await _firebaseAuth.signInWithCredential(credential);
    final _user = authResult.user;
    if (_user != null) {
      Logger().e(_user);
      assert(!_user.isAnonymous);
      return Future.value(
        _user,
      );
    } else {
      return 'An error occured';
    }
  }

  @override
  Future<void> signOut() async {
    return Future.value([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
  }

  @override
  Future<dynamic> signInWithEmailAndPassword(SignInDTO signInDTO) async {
    UserCredential? userCredential;
    try {
      userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: signInDTO.email,
        password: signInDTO.password,
      );
      if (userCredential.user != null) {
        return userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      Logger().e(e.toString());

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
