class User {
  String _email = '';

  String get email => _email;
  set email(String email) => _email = email;

  User(String email) : _email = email;
}

mixin UserMixin on User {
  @override
  String get email => super.email.split('@').last;
}

class AdminUser extends User with UserMixin {
  AdminUser(String email) : super(email);
}

class GeneralUser extends User {
  GeneralUser(String email) : super(email);
}

class UserManager<T extends User> {
  final users = <T>[];

  void addUser(T user) => users.add(user);
  void removeUser(T user) => users.remove(user);
  void removeUsers() => users.clear();
  List<String> getUsers() => users.map((user) => user.email).toList();
}
