import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_time_chat/widgets/chatmenssage.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _chatControlles = TextEditingController();
  final _focusNode = FocusNode();
  bool _estaEscribiendo = false;

  List<ChatMenssage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Column(children: [
          CircleAvatar(
            maxRadius: 12,
            backgroundColor: Colors.greenAccent,
            child: Text(
              'Te',
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            'Juan Flores',
            style: TextStyle(color: Colors.black87, fontSize: 12),
          )
        ]),
      ),
      body: Container(
          child: Column(
        children: [
          Flexible(
              child: ListView.builder(
                  itemCount: _messages.length,
                  reverse: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (_, i) => _messages[i])),
          Divider(
            height: 1,
          ),
          //TODO: CAJA DE TEXTO
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: _inputChat(),
          )
        ],
      )),
    );
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Flexible(
                    child: TextField(
                  controller: _chatControlles,
                  onSubmitted: (String text) => _handleSubmit(text),
                  onChanged: (String texto) {
                    setState(() {
                      if (texto.trim().length > 0) {
                        _estaEscribiendo = true;
                      } else {
                        _estaEscribiendo = false;
                      }
                    });
                    //TODO:CUando hay un valor, para poder postearlo
                  },
                  decoration:
                      InputDecoration.collapsed(hintText: 'Enviar Mensaje'),
                  focusNode: _focusNode,
                )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconTheme(
                      data: IconThemeData(color: Colors.blue),
                      child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: const Icon(
                            Icons.send,
                          ),
                          onPressed: _estaEscribiendo
                              ? () => _handleSubmit(_chatControlles.text.trim())
                              : null),
                    ),
                  ),
                )
              ],
            )));
  }

  _handleSubmit(String texto) {
    if (texto.length == 0) return;

    print(texto);
    _chatControlles.clear();
    _focusNode.requestFocus();

    final newMessage = ChatMenssage(
      texto: texto,
      uid: '123',
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 400)),
    );
    _messages.insert(0, newMessage);

    newMessage.animationController.forward();
    setState(() {
      _estaEscribiendo = false;
    });
  }

  @override
  void dispose() {
    // TODO: off del socket

    for (ChatMenssage message in _messages) {
      message.animationController.dispose();
    }

    super.dispose();
  }
}
