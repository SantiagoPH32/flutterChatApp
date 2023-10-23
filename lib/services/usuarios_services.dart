import 'package:flutterchat/global/environment.dart';
import 'package:flutterchat/models/usuario.dart';
import 'package:flutterchat/models/usuarios_response.dart';
import 'package:flutterchat/services/auth_service.dart';
import 'package:http/http.dart' as http;

class UsuariosServices {
  Future<List<Usuario>> getUsuarios() async {
    String? token = await AuthService.getToken();
    try {
      final uri = Uri.parse('${Environment.apiUrl}/users');
      final resp = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'x-token': token.toString()
      });

      final usuariosResponse = usuariosResponseFromJson(resp.body);

      return usuariosResponse.usuarios;
    } catch (e) {
      return [];
    }
  }
}
