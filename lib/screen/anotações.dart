import 'package:flutter/material.dart';
import 'package:study/components/custom_drawer.dart';

class Slaoq extends StatefulWidget {
  @override
  _SlaoqState createState() => _SlaoqState();
}

class _SlaoqState extends State<Slaoq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text('Aqui mostra as anotações'),
      ),
    );
  }
}
