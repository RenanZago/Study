import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study/screen/alternativas/alternativas_ingles.dart';

class QuestoesIngles extends StatefulWidget {
  @override
  HomePageStateM createState() => HomePageStateM();
}

class HomePageStateM extends State<QuestoesIngles> {

  List<String> imagesI = [
    "images/ingles leitura e interpretação de textos.png",
    "images/ingles leitura e interpretação de cartuns.png",
    "images/ingles.png",
    "images/ingles interpretação de cançoes.png",
    "images/genero textual.png",
  ];

  List<String> desI = [
    "Faça questões de Leitura e Interpretação",
    "Faça questões de Leitura e Interpretação de Cartuns, Tiras e Charges",
    "Faça questões de Domínio Lexical",
    "Faça questões de Análise e Interpretação de Poemas e Canções",
    "Faça questões de Identificação da Função do Texto",
  ];

  Widget customcard(String materias, String imagemI, String desI){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => GetJsonINGLES(materias),
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
                            imagemI,
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
                    desI,
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
          "Inglês",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Leitura e Interpretação", imagesI[0], desI[0]),
          customcard("Leitura e Interpretação de Cartuns", imagesI[1], desI[1]),
          customcard("Domínio Lexical", imagesI[2], desI[2]),
          customcard("Análise e Interpretação de Poemas e Canções", imagesI[3], desI[3]),
          customcard("Identificação da Função do Texto", imagesI[4], desI[4]),
        ],
      ),
    );
  }
}