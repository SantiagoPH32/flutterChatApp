import 'package:flutter/material.dart';

class CustomWidgets extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType KeyboardType;
  final bool isPassWord;

  const CustomWidgets(
      {super.key,
      required this.icon,
      required this.placeholder,
      required this.textController,
      this.KeyboardType = TextInputType.text,
      this.isPassWord = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: Offset(0, 5),
                  blurRadius: 5)
            ]),
        child: TextField(
          controller: this.textController,
          obscureText: this.isPassWord,
          autocorrect: false,
          keyboardType: this.KeyboardType,
          // obscureText: true,
          decoration: InputDecoration(
              prefixIcon: Icon(this.icon),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: this.placeholder),
        ));
  }
}
