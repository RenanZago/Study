import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study/screen/alternativas/alternativas_sociologia.dart';

class QuestoesSociologia extends StatefulWidget {
  @override
  HomePageStateS createState() => HomePageStateS();
}

class HomePageStateS extends State<QuestoesSociologia> {

  List<String> imagesS = [
    "images/mundo do trabalho.png",
    "images/cultura e industria cultural.png",
    "images/ideologia.png",
    "images/meios de comuniçação e tecnologia.png",
    "images/cidadania.png",
  ];

  List<String> desS = [
    "Faça questões de Mundo do Trabalho",
    "Faça questões de Cultura e Indústria Cultural ",
    "Faça questões de Ideologia ",
    "Faça questões de Meios de Comunicação e Tecnologia ",
    "Faça questões de Cidadania ",
  ];

  Widget customcard(String materias, String imagemS, String desS){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => GetJsonSOCIOLOGIA(materias),
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
                            imagemS,
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
                    desS,
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
          "Sociologia",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Mundo do Trabalho", imagesS[0], desS[0]),
          customcard("Cultura e Indústria Cultural ", imagesS[1], desS[1]),
          customcard("Ideologia ", imagesS[2], desS[2]),
          customcard("Meios de Comunicação", imagesS[3], desS[3]),
          customcard("Cidadania", imagesS[4], desS[4]),
        ],
      ),
    );
  }
}