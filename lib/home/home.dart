import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:chat/models/user.dart';

class HomePage extends StatefulWidget {
  String userId;
  Users user;

  HomePage({
    Key key,
    this.userId,
    this.user,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
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
              ),
              child: SizedBox.expand(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: widget.user.url != null
                                  ? NetworkImage(widget.user.url)
                                  : AssetImage(
                                      "assets/iconDrawer.png",
                                    ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 35,
                        left: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.user.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.user.email,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
