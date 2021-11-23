import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study/screen/Alternativas/Alternativas_Quimica.dart';

class QuestoesQuimica extends StatefulWidget {
  @override
  HomePageStateQ createState() => HomePageStateQ();
}

class HomePageStateQ extends State<QuestoesQuimica> {

  List<String> imagesQ = [
    "images/Quimica_basica.png",
    "images/Quimica_Geral.png",
    "images/Fisico-Quimica.png",
    "images/Quimica_Organica.png",
    "images/Meio_Ambiente.png",
    "images/Energia.png",
  ];

  List<String> desQ = [
    "Faça questões de Química Básica",
    "Faça questões de Química Geral",
    "Faça questões de Físico-Química",
    "Faça questões de Química Orgânica",
    "Faça questões de Meio Ambiente",
    "Faça questões de Energia",
  ];

  Widget customcard(String materiasQUIMICA, String imagemQ, String desQ){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => GetJsonQUIMICA(materiasQUIMICA),
          ));
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
                    vertical: 10.0,
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
                            imagemQ,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    materiasQUIMICA,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    desQ,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: "Alike"
                    ),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
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
          "Química",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Química Básica", imagesQ[0], desQ[0]),
          customcard("Química Geral", imagesQ[1], desQ[1]),
          customcard("Físico-Química", imagesQ[2], desQ[2]),
          customcard("Química Orgânica", imagesQ[3], desQ[3]),
          customcard("Meio Ambiente", imagesQ[4], desQ[4]),
          customcard("Energia", imagesQ[5], desQ[5]),
        ],
      ),
    );
  }
}