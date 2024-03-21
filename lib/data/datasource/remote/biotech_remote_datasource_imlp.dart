import 'package:biomedic_control/data/helpers/helpers.dart';
import 'package:biomedic_control/domain/datasource/biotech_remote_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart'
    show User, FirebaseAuthException, FirebaseAuth, GoogleAuthProvider;
import 'package:google_sign_in/google_sign_in.dart' show GoogleSignIn;

class BiotechRemoteDatasourceImpl implements BiotechRemoteDatasource {
  BiotechRemoteDatasourceImpl({
    required this.authProvider,
  });
  final FirebaseAuth authProvider;

  @override
  Future<Either<Failure, bool>> loginWithGmail() async {
    try {
      final accountGoogle = await GoogleSignIn().signIn();

      final googleAuth = await accountGoogle?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userCredential = await authProvider.signInWithCredential(
        credential,
      );

      return Either.right(userCredential.user != null);
    } on FirebaseAuthException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (e) {
      throw const LogInWithGoogleFailure();
    }
  }

  @override
  Stream<User?> get user {
    return authProvider.authStateChanges().map((firebaseUser) {
      return firebaseUser;
    });
  }

  @override
  Future<void> logout() async {
    await authProvider.signOut();
  }
}
