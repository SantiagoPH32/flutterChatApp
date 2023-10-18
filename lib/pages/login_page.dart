import 'package:flutter/material.dart';
import 'package:real_time_chat/widgets/botonAzul.dart';
import 'package:real_time_chat/widgets/custom_input.dart';
import 'package:real_time_chat/widgets/labelslogin.dart';
import 'package:real_time_chat/widgets/logoLogin.dart';

class LoginPage extends StatelessWidget {
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
                    mensaje: 'Messenger',
                  ),
                  _Form(),
                  Labels(
                    label: '¿No tienes una cuenta?',
                    labelBotton: 'Crea una ahora!',
                    ruta: 'register',
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
  final emailController = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
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
            text: 'Iniciar Sesión',
            onPresseds: () {
              print(emailController.text);
              print(passwordcontroller.text);
            },
          )
        ],
      ),
    );
  }
}
