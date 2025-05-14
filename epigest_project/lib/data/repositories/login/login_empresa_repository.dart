import 'package:epigest_project/data/models/login/empresa.dart';
import 'package:epigest_project/data/repositories/login/login_repository.dart';
import 'package:result_dart/result_dart.dart';
import 'package:result_dart/src/types.dart';

class LoginEmpresaRepository implements LoginRepository {
  @override
  AsyncResult<Empresa> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  AsyncResult<Empresa> login(String cpfCnpj, String senha) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  AsyncResult<Unit> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
  
}