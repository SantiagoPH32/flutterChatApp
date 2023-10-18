import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String mensaje;

  const Logo({super.key, required this.mensaje});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 25),
        width: 170,
        child: Column(children: [
          const Image(image: AssetImage('assets/tag-logo.png')),
          const SizedBox(
            height: 20,
          ),
          Text(
            this.mensaje,
            style: TextStyle(fontSize: 30),
          )
        ]),
      ),
    );
  }
}
