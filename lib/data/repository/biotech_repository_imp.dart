import 'package:biomedic_control/data/data.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BiotechRepositoryImpl implements BiotechRepository {
  final BiotechRemoteDatasource remoteDatasource;

  BiotechRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<Failure, bool>> loginWithGmail() {
    return remoteDatasource.loginWithGmail();
  }

  @override
  Stream<User?> get user => remoteDatasource.user;

  @override
  Future<void> logout() {
    return remoteDatasource.logout();
  }
}
