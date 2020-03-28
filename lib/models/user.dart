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

  @Observable
  File imgFile;

  @observable
  

}