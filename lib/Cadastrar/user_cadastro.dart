import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserCadastro extends StatelessWidget {
  Users user = Users();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Color.fromRGBO(65, 176, 255, 1), 
       title: Text("Realizar Cadastro"),
       centerTitle: true,
       actions: <Widget>[
         IconButton(icon: Icon(Icons.refresh), onPressed: (){}, tooltip: "Reiniciar Campos",)
       ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GestureDetector(
              child: Container(
                width: 120,
                height: 120,
                child: null,
              ),
              onTap: (){
                ImagePicker.pickImage(source:ImageSource.gallery).then((file){
                  if(file!=null){
                    return;
                  }else{
                    
                  }
                });
              },
            )
          ],
        ),
      ),
      
    );
  }
}