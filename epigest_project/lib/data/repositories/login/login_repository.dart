import 'package:result_dart/result_dart.dart';

abstract interface class LoginRepository {
  AsyncResult login(String cpfCnpj, String senha);
  AsyncResult logout();
  AsyncResult getUser();
}