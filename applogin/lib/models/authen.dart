class Authen {
  static String username = 'admin';
  static String password = '123456';
  static bool checkedAccount(String user, String psw) {
    if (user.trim() == username && password == psw.trim()) {
      return true;
    }
    return false;
  }
}
