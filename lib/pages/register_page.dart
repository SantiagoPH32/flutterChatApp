import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_time_chat/helpers/monstrar_alerta.dart';
import 'package:real_time_chat/services/auth_services.dart';
import 'package:real_time_chat/widgets/botonAzul.dart';
import 'package:real_time_chat/widgets/custom_input.dart';
import 'package:real_time_chat/widgets/labelslogin.dart';
import 'package:real_time_chat/widgets/logoLogin.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(225, 242, 242, 242),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Logo(
                    mensaje: 'Registro',
                  ),
                  _Form(),
                  Labels(
                    label: '¿Ya tienes una cuenta?',
                    labelBotton: 'Ingresa ahora!',
                    ruta: 'login',
                  ),
                  const Text(
                    'Terminos y condiciones de uso',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          CustomWidgets(
            textController: nameController,
            icon: Icons.person,
            placeholder: 'Nombre',
            KeyboardType: TextInputType.text,
          ),
          CustomWidgets(
            textController: emailController,
            icon: Icons.mail_outline,
            placeholder: 'Correo Electronico',
            KeyboardType: TextInputType.emailAddress,
          ),
          CustomWidgets(
            textController: passwordcontroller,
            icon: Icons.lock_open,
            placeholder: 'Contraseña',
            isPassWord: true,
          ),

          //TODO Crear boton
          BotonAzul(
             text: 'Crear cuenta',
             onPresseds: authService.autenticando ? ()=>{} : () async {
             
               var registroOk = await authService.register(nameController.text.trim(), emailController.text.trim(), passwordcontroller.text.trim());

               if ( registroOk == true ) {
                //  TODO: Conectar socket server
                Navigator.pushReplacementNamed(context, 'usuarios');
               } else {
                 mostrarAlerta(context, 'Registro incorrecto', registroOk.toString() );
               }

             },
           )
        ],
      ),
    );
  }
}
