// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Users on _UsersBase, Store {
  final _$emailAtom = Atom(name: '_UsersBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$senhaAtom = Atom(name: '_UsersBase.senha');

  @override
  String get senha {
    _$senhaAtom.context.enforceReadPolicy(_$senhaAtom);
    _$senhaAtom.reportObserved();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.context.conditionallyRunInAction(() {
      super.senha = value;
      _$senhaAtom.reportChanged();
    }, _$senhaAtom, name: '${_$senhaAtom.name}_set');
  }

  final _$nameAtom = Atom(name: '_UsersBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$imgFileAtom = Atom(name: '_UsersBase.imgFile');

  @override
  File get imgFile {
    _$imgFileAtom.context.enforceReadPolicy(_$imgFileAtom);
    _$imgFileAtom.reportObserved();
    return super.imgFile;
  }

  @override
  set imgFile(File value) {
    _$imgFileAtom.context.conditionallyRunInAction(() {
      super.imgFile = value;
      _$imgFileAtom.reportChanged();
    }, _$imgFileAtom, name: '${_$imgFileAtom.name}_set');
  }

  final _$urlAtom = Atom(name: '_UsersBase.url');

  @override
  String get url {
    _$urlAtom.context.enforceReadPolicy(_$urlAtom);
    _$urlAtom.reportObserved();
    return super.url;
  }

  @override
  set url(String value) {
    _$urlAtom.context.conditionallyRunInAction(() {
      super.url = value;
      _$urlAtom.reportChanged();
    }, _$urlAtom, name: '${_$urlAtom.name}_set');
  }

  final _$_UsersBaseActionController = ActionController(name: '_UsersBase');

  @override
  void setImage(File img) {
    final _$actionInfo = _$_UsersBaseActionController.startAction();
    try {
      return super.setImage(img);
    } finally {
      _$_UsersBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'email: ${email.toString()},senha: ${senha.toString()},name: ${name.toString()},imgFile: ${imgFile.toString()},url: ${url.toString()}';
    return '{$string}';
  }
}
