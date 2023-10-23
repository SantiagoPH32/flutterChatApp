import 'package:flutter/material.dart';
import 'package:flutterchat/global/environment.dart';
import 'package:flutterchat/models/mensajes_response.dart';
import 'package:flutterchat/models/usuario.dart';
import 'package:flutterchat/services/auth_service.dart';
import 'package:http/http.dart' as http;

class ChatServices with ChangeNotifier {
  Usuario? usuariosPara;

  Future getChat(String usuarioID) async {
    String? token = await AuthService.getToken();
    final uri = Uri.parse('${Environment.apiUrl}/mensajes/$usuarioID');
    final resp = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'x-token': token.toString()
    });

    final mensajeResponse = mensajesResponseFromJson(resp.body);
    return mensajeResponse.mensajes;
  }
}
