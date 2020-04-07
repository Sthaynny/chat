import 'dart:io';

import 'package:chat/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';

final _nameController = TextEditingController(text: '');
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _rPasswordController = TextEditingController();

class UserCadastro extends StatelessWidget {
  Users user = Users();
  @override
  Widget build(BuildContext context) {
    user.name = '';
    user.email = '';
    user.senha = '';
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(65, 176, 255, 1),
        child: Icon(Icons.save),
        onPressed: () async {
          if(user.imgFile!=null){
            StorageUploadTask task = FirebaseStorage.instance
            .ref()
            .child(DateTime.now().millisecondsSinceEpoch.toString())
            .putFile(user.imgFile);
            StorageTaskSnapshot taskSnapshot = await task.onComplete;
            user.url = await taskSnapshot.ref.getDownloadURL();
          }
          int validPassword = user.senha.compareTo(_rPasswordController.text);
          if (validPassword == 0) {
            Firestore.instance.collection('users').add(user.fromMap());
            _refresh();
            Navigator.pop(context);
          } else
            print("senhas não corespondem");
        },
      ),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(65, 176, 255, 1),
        title: Text("Realizar Cadastro"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _refresh,
            tooltip: "Reiniciar Campos",
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Observer(
              builder: (_) => GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: user.imgFile != null
                              ? FileImage(user.imgFile)
                              : AssetImage(
                                  "assets/iconProfile.png",
                                ))),
                ),
                onTap: () {
                  ImagePicker.pickImage(source: ImageSource.gallery)
                      .then((file) {
                    if (file != null) {
                      user.setImage(file);
                      return;
                    } else {
                      return;
                    }
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  labelText: "Nome",
                  labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 16)),
              onChanged: (text) {
                user.name = text;
              },
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  labelText: "Email",
                  labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 16)),
              style: TextStyle(fontSize: 16),
              onChanged: (text) {
                user.email = text;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  labelText: "Senha",
                  labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 16)),
              style: TextStyle(fontSize: 16),
              onChanged: (text) {
                user.senha = text;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _rPasswordController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  labelText: "Repetir senha",
                  labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 16)),
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  void _refresh() {
    _nameController.text = '';
    _emailController.text = '';
    _passwordController.text = '';
    _rPasswordController.text = '';
  }
}
