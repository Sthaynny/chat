import 'dart:io';

import 'package:chat/chatScreen/widgets/chatMessage.dart';
import 'package:chat/chatScreen/widgets/textComposer.dart';
import 'package:chat/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ChatScreen extends StatefulWidget {
  final Users user;
  final String userId;

  const ChatScreen({Key key, this.user, this.userId}) : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = false;

  FirebaseUser _currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /*FirebaseAuth.instance.onAuthStateChanged.listen((user) {
      _currentUser = user;
    });*/
  }

  Future<FirebaseUser> _getUser() async {
    if (_currentUser != null) return _currentUser;
    /*
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleSignInAuthentication.accessToken, idToken: googleSignInAuthentication.idToken);
          

      final AuthResult authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final FirebaseUser user = authResult.user;

      return user;
    } catch (err) {
      print('AQUUIIIIIIIIIIIIIII ESTA O ERRO --------------------------------------- '+err.toString());
      return null;
    }*/
  }

  void _sendMenssage(
      {String text, File imgFile, Users user, String userId}) async {
    Map<String, dynamic> data = {
      'uid': userId,
      'senderName': user.name,
      'senderPhotoUrl': user.url,
      'time': Timestamp.now()
    };

    if (imgFile != null) {
      StorageUploadTask task = FirebaseStorage.instance
          .ref()
          .child(userId)
          .child(DateTime.now().millisecondsSinceEpoch.toString())
          .putFile(imgFile);
      setState(() {
        _isLoading = true;
      });

      StorageTaskSnapshot taskSnapshot = await task.onComplete;
      String url = await taskSnapshot.ref.getDownloadURL();
      data['imgUrl'] = url;
      setState(() {
        _isLoading = false;
      });
    }
    if (text != null) {
      data['text'] = text;
    }
    Firestore.instance.collection("messages").add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Olá, ${widget.user.name}"),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance
                  .collection("messages")
                  .orderBy("time")
                  .snapshots(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                    break;
                  default:
                    List<DocumentSnapshot> documents =
                        snapshot.data.documents.reversed.toList();
                    return ListView.builder(
                      itemCount: documents.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return ChatMassage(
                          data: documents[index].data,
                          mine: documents[index].data['uid'] == widget.userId,
                        );
                      },
                    );
                }
              },
            ),
          ),
          _isLoading ? LinearProgressIndicator() : Container(),
          TextComposer(
            user: widget.user,
            userId: widget.userId,
            sendMenssage: _sendMenssage,
          ),
        ],
      ),
    );
  }
}
