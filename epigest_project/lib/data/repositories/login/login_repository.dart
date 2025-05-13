abstract interface class LoginRepository {
  login(String cpfCnpj, String senha);
  logout();
  getUser();
}