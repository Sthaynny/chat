import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {
  TextComposer(this.sendMenssage);

  final Function({String text, File imgFile}) sendMenssage;
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
          IconButton(icon: Icon(Icons.photo_camera), onPressed: ()async {
            final File imgFile = await ImagePicker.pickImage(source: ImageSource.camera);
            if(imgFile==null){
              return;
            }else{
              widget.sendMenssage(imgFile: imgFile);
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
              widget.sendMenssage(text:text);
              _textController.clear();
              reset();
            },
          )),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _isComposer
                ? () {
                    widget.sendMenssage(text:_textController.text);
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
