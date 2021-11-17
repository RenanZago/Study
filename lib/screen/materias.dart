import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study/screen/quest%C3%B5es/fisica.dart';
import 'package:study/screen/quest%C3%B5es/matematica.dart';
import 'package:study/screen/quest%C3%B5es/quimica.dart';

class Questoes extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<Questoes> {

  List<String> images = [
    "images/MATEMATICA.png",
    "images/quimica.png",
    "images/fisica.png",
    "images/biologia.png",
    "images/geografia.png",
    "images/historia.png",
    "images/sociologia.png",
    "images/portugues.png",
    "images/ingles.png",
    "images/filosofia.png",
    "images/espanhol.png",
  ];

  Widget customcard(String materias, String imagem){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: () {
          if (materias == 'Matemática')
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => QuestoesMatematica()));
                    if (materias == 'Química')
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => QuestoesQuimica()));
                    if (materias == 'Física')
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => QuestoesFisica()));
        },
        child: Material(
          color: Colors.blue.shade800,
          elevation: 15.0,
          borderRadius: BorderRadius.circular(40.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 30.0,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      child: ClipPath(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            imagem,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    materias,
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text(
          "",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Matemática", images[0]),
          customcard("Química", images[1],),
          customcard("Física", images[2]),
          customcard("Biologia", images[3]),
          customcard("Geografia", images[4]),
          customcard("História", images[5]),
          customcard("Sociologia", images[6]),
          customcard("Português", images[7]),
          customcard("Inglês", images[8]),
          customcard("Filosofia", images[9]),
          customcard("Espanhol", images[10]),
        ],
      ),
    );
  }
}