import 'package:chat/Cadastrar/user_cadastro.dart';
import 'package:chat/Login/login_page.dart';
import 'package:flutter/material.dart';

class InitApp extends StatelessWidget {
  const InitApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    width: 128,
                    height: 128,
                    child: Image.asset('assets/icon.png'),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Pronto para começar o bate papo!",
                    style: TextStyle(
                      fontFamily: 'fonts/ComicNeue-Regular.ttf',
                      fontSize: 18,
                      color: Color.fromRGBO(65, 176, 255, 1),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  Container(
                    height: 60,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [
                            0.3,
                            1
                          ],
                          colors: [
                            Color.fromRGBO(65, 176, 255, 1),
                            Color.fromRGBO(46, 204, 232, 1)
                          ]),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: SizedBox.expand(
                      child: FlatButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Cadastre-se",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Icon(
                              Icons.person_add,
                              size: 28,
                              color: Colors.white,
                            )
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserCadastro()));
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    height: 60,
                    alignment: Alignment.center,
                    child: SizedBox.expand(
                      child: FlatButton(
                        child: Text(
                          "Entrar",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color.fromRGBO(65, 176, 255, 1),
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
