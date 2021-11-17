import 'package:flutter/material.dart';

class Configuracao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text(
          "Configuração",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
    );
  }
}
