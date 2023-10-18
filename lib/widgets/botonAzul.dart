import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String text;
  final void Function()? onPresseds;

  const BotonAzul({
    super.key,
    required this.text,
    required this.onPresseds,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: this.onPresseds,
        child: Container(
            height: 45,
            width: double.infinity,
            child: Center(
              child: Text(
                this.text,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )));
  }
}
