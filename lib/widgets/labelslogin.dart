import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String ruta;
  final String labelBotton;
  final String label;

  const Labels(
      {super.key,
      required this.ruta,
      required this.labelBotton,
      required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Column(children: [
        Text(
          this.label,
          style: TextStyle(
              color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),
        ),
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
          child: Text(
            this.labelBotton,
            style: TextStyle(
                color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.pushReplacementNamed(context, this.ruta);
          },
        )
      ]),
    );
  }
}
