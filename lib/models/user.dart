import 'dart:io';

import 'package:mobx/mobx.dart';
part 'user.g.dart';

class Users = _UsersBase with _$Users;

abstract class _UsersBase with Store {
  @observable
  String email;

  @observable
  String senha;

  @observable
  String name;

  @observable
  File imgFile;

  @observable
  String url;

  @action
  void setImage(File img) {
    imgFile = img;
  }

  Map<String, dynamic> fromMap() {
    Map<String, dynamic> newUser = {
      "name": name,
      "email": email,
      "senha": senha,
      'imgUrl': url
    };
    return newUser;
  }

  void toMap(Map<String, dynamic> map) {
    name = map['name'];
    email = map['email'];
    senha = map['senha'];
    url = map['imgUrl'];
  }

  void printString() {
    print(name);
    print(email);
    print(senha);
    print(url);
  }
}
