import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study/screen/alternativas/alternativas_portugues.dart';

class QuestoesPortugues extends StatefulWidget {
  @override
  HomePageStateP createState() => HomePageStateP();
}

class HomePageStateP extends State<QuestoesPortugues> {

  List<String> imagesM = [
    "images/ingles leitura e interpretação de textos.png",
    "images/estrutura textual e analise de discurso.png",
    "images/leituras e artes.png",
    "images/genero textual.png",
    "images/literatura.png",
  ];

  List<String> desM = [
    "Faça questões de Leitura e Interpretação de Textos",
    "Faça questões de Estrutura Textual e Análise de Discurso",
    "Faça questões de Leituras e Artes",
    "Faça questões de Gênero Textual",
    "Faça questões de Literatura",
  ];

  Widget customcard(String materias, String imagemP, String desP){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => GetJsonPORTUGUES(materias),
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
                            imagemP,
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
                    desP,
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
          "Português",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Interpretação de Textos", imagesM[0], desM[0]),
          customcard("Estrutura Textual ", imagesM[1], desM[1]),
          customcard("Leituras e Artes", imagesM[2], desM[2]),
          customcard("Gênero Textual", imagesM[3], desM[3]),
          customcard("Literatura", imagesM[4], desM[4]),
        ],
      ),
    );
  }
}