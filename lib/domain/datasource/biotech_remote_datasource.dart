import 'package:biomedic_control/data/helpers/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart' show User;

abstract class BiotechRemoteDatasource {
  Future<Either<Failure, bool>> loginWithGmail();
  Future<void> logout();
  Stream<User?> get user;
}
