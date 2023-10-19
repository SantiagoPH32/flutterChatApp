import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:real_time_chat/models/usuario.dart';
import 'package:real_time_chat/services/auth_services.dart';

class UsuariosPage extends StatefulWidget {
  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final List<Usuario> usuarios = [
    Usuario(
        online: true,
        email: 'Santiago123ph@gmail.com',
        nombre: 'Santiago',
        uid: '1'),
    Usuario(
        online: false, email: 'Juan123ph@gmail.com', nombre: 'Juan', uid: '1'),
    Usuario(
        online: true, email: 'Anna123ph@gmail.com', nombre: 'Anna', uid: '1')
  ];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final usuario = authService.usuario;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            usuario?.nombre ?? 'Sin Nombre',
            style: TextStyle(color: Colors.black45),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.black,
            ),
            onPressed: () {
              //Todo Desconectarnos del socket

              //logout

              Navigator.pushReplacementNamed(context, 'login');
              AuthService.deleteToken();
            },
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child:
                  //  Icon(Icons.check_circle, color: Colors.green,)
                  Icon(
                Icons.remove_circle,
                color: Colors.red,
              ),
            )
          ],
        ),
        body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          onRefresh: _cargarUsuarios,
          header: WaterDropHeader(
            complete: Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
            waterDropColor: Colors.green,
          ),
          child: _ListviewUsuarios(),
        ));
  }

  ListView _ListviewUsuarios() {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, i) => _usuarioListTile(usuarios[i]),
        separatorBuilder: (_, i) => Divider(),
        itemCount: usuarios.length);
  }

  ListTile _usuarioListTile(Usuario usuario) {
    Random random = new Random();
    return ListTile(
      title: Text(usuario.nombre),
      subtitle: Text(usuario.email),
      leading: CircleAvatar(
        backgroundColor: Color.fromARGB(random.nextInt(255), random.nextInt(10),
            random.nextInt(10), random.nextInt(100)),
        child: Text(
          usuario.nombre.substring(0, 2),
          style: TextStyle(color: Colors.black),
        ),
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: usuario.online ? Colors.green : Colors.red),
      ),
    );
  }

  _cargarUsuarios() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}
