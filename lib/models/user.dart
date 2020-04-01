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

  @action
  void setImage(File img){
    imgFile=img;
  }

  

}