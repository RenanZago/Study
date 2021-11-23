import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study/screen/alternativas/alternativas_biologia.dart';

class QuestoesBiologia extends StatefulWidget {
  @override
  HomePageStateB createState() => HomePageStateB();
}

class HomePageStateB extends State<QuestoesBiologia> {

  List<String> imagesB = [
    "images/biologia.png",
    "images/humanidade e ambiente.png",
    "images/citologia.png",
    "images/histologia e fisiologia.png",
    "images/biologia.png",
    "images/biotecnologia.png",
  ];

  List<String> desB = [
    "Faça questões de Biologia Basica",
    "Faça questões de Humanidade e Ambiente",
    "Faça questões de Citologia",
    "Faça questões de Histologia e Fisiologia",
    "Faça questões de Fundamentos da Ecologia",
    "Faça questões de Biotecnologia",
  ];

  Widget customcard(String materias, String imagemB, String desB){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => GetJsonBIOLOGIA(materias),
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
                            imagemB,
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
                    desB,
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
          "Biologia",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Biologia Basica", imagesB[0], desB[0]),
          customcard("Humanidade e Ambiente", imagesB[1], desB[1]),
          customcard("Citologia ", imagesB[2], desB[2]),
          customcard("Histologia e Fisiologia", imagesB[3], desB[3]),
          customcard("Fundamentos da Ecologia", imagesB[4], desB[4]),
          customcard("Biotecnologia ", imagesB[5], desB[5]),
          
        ],
      ),
    );
  }
}