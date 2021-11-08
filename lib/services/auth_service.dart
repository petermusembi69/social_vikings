part of social_services;

abstract class AuthService {
  Future<dynamic> createUserWithEmailAndPassword(SignInDTO signInDTO);
  Future<dynamic> signInWithEmailAndPassword(SignInDTO signInDTO);
  Future<dynamic> signInWithFacebook();
  Future<dynamic> signInWithGoogle();
  Future<void> signOut();
}

class AuthServiceImpl implements AuthService {
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<dynamic> signInWithGoogle() async {
    try {
      final googleSignInAccount = await _googleSignIn.signIn();
      assert(googleSignInAccount != null);
      final googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      final authResult = await _firebaseAuth.signInWithCredential(credential);
      final user = authResult.user;

      if (user != null) {
        assert(!user.isAnonymous);
        return Future.value(
          MemberAuthDTO(
            email: user.email!,
            name: user.displayName,
            image: null,
          ),
        );
      } else {
        return 'An error occured';
      }
    } catch (e) {
      Logger().e(e.toString());
      return 'An error occured';
    }
  }

  @override
  Future<dynamic> signInWithFacebook() async {
    try {
      final result = await _facebookAuth.login();
      AuthCredential? credential;
      if (result.status == LoginStatus.success) {
        assert(result.accessToken != null);
        AccessToken myToken = result.accessToken!;
        credential = FacebookAuthProvider.credential(myToken.token);
      }
      final authResult = await _firebaseAuth.signInWithCredential(credential!);
      final user = authResult.user;
      if (user != null) {
        assert(!user.isAnonymous);
        assert(user.email != null);
        return Future.value(
          MemberAuthDTO(
            email: user.email!,
            name: user.displayName,
            image: user.photoURL,
          ),
        );
      } else {
        return 'An error occured';
      }
    } catch (e) {
      Logger().e(e.toString());
      return 'An error occured';
    }
  }

  @override
  Future<void> signOut() async {
    return Future.value([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
      _facebookAuth.logOut()
    ]);
  }

  @override
  Future<dynamic> signInWithEmailAndPassword(SignInDTO signInDTO) async {
    UserCredential? userCredential;
    try {
      userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: signInDTO.email,
        password: signInDTO.password,
      );
      final user = userCredential.user;
      if (user != null) {
        assert(!user.isAnonymous);
        assert(user.email != null);
        return MemberAuthDTO(
          email: user.email!,
          name: user.displayName,
          image: null,
        );
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
    } catch (e) {
      Logger().e(e.toString());
      return 'An error occured';
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
      final user = userCredential.user;
      if (user != null) {
        assert(!user.isAnonymous);
        assert(user.email != null);
        return MemberAuthDTO(
          email: user.email!,
          name: user.displayName,
          image: null,
        );
      }
    } on FirebaseAuthException catch (e) {
      Logger().e(e.toString());
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The email account already exists.';
      }
    } catch (e) {
      Logger().e(e.toString());
      return 'Account creation failed.';
    }
  }
}
