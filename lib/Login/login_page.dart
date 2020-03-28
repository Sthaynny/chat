import 'package:chat/Cadastrar/user_cadastro.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 80,left: 20,right: 20),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset('assets/icon.png'),
              
            ),
            SizedBox(height: 40,),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20
                )
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 15,),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20
                )
              ),
              style: TextStyle(fontSize: 20),
            ),
            Container(
              padding: EdgeInsets.only(top: 12),
              height: 40,
              alignment: Alignment.bottomRight,
              child: FlatButton(
                child: Text("Recuperar Senha", textAlign: TextAlign.right,style: TextStyle(color: Color.fromRGBO(255, 89, 76, 0.7))),
                onPressed: (){

                },
              ),
              
            ),
            SizedBox(height: 40,),

            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3,1],
                  colors: [
                    Color.fromRGBO(65, 176, 255, 1),
                    Color.fromRGBO(46, 204, 232, 1)
                  ]
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                
              ),

              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Entrar", style: TextStyle(color: Colors.white, fontSize: 20),),
                      Icon(Icons.exit_to_app, size: 28, color: Colors.white,)
                    ],
                  ),
                  onPressed: (){

                  },
                ),
              ),

            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              height: 60,
              alignment: Alignment.center,
              child: FlatButton(
                child: Text("Realizar Cadastro", textAlign: TextAlign.right, style: TextStyle(color: Color.fromRGBO(65, 176, 255, 1)),),
                onPressed: (){
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=> UserCadastro())
                  );
                },
              ),
              
            ),
            
          ],
        ),
      ),
    );
  }
}