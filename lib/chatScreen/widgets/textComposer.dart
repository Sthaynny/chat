import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:chat/models/user.dart';

class TextComposer extends StatefulWidget {
  Users user;
  String userId;
  TextComposer({
    Key key,
    this.user,
    this.userId,
    this.sendMenssage,
  }) : super(key: key);

  final Function({String text, File imgFile, Users user, String userId})
      sendMenssage;
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  final _textController = TextEditingController();

  bool _isComposer = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () async {
                final File imgFile =
                    await ImagePicker.pickImage(source: ImageSource.camera);
                if (imgFile == null) {
                  return;
                } else {
                  widget.sendMenssage(
                    imgFile: imgFile,
                    user: widget.user,
                    userId: widget.userId,
                  );
                }
              }),
          Expanded(
              child: TextField(
            controller: _textController,
            decoration:
                InputDecoration.collapsed(hintText: "Enviar uma Mensagem"),
            onChanged: (text) {
              setState(() {
                _isComposer = text.isNotEmpty;
              });
            },
            onSubmitted: (text) {
              widget.sendMenssage(text: text);
              _textController.clear();
              reset();
            },
          )),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _isComposer
                ? () {
                    widget.sendMenssage(
                      text: _textController.text,
                      user: widget.user,
                      userId: widget.userId,
                    );
                    _textController.clear();
                    reset();
                  }
                : null,
          )
        ],
      ),
    );
  }

  void reset() {
    setState(() {
      _isComposer = false;
    });
  }
}
