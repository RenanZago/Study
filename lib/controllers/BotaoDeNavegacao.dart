///Macumba, não mexa
///Aqui é a parte da navegação da barra de baixo
import 'package:flutter/material.dart';
import 'package:study/pages/Configuracao.dart';
import 'package:study/pages/Desempenho.dart';
import 'package:study/pages/Inicio.dart';

class MyApp extends StatelessWidget {
  final study = 'Study';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: study,
      home: MyBottomNavigationBar(),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    Slaoq(),
    Configuracao(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: ("Anotações"),
          ),
        ],
      ),
    );
  }
}
