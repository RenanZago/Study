import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study/screen/alternativas/alternativas_espanhol.dart';

class QuestoesEspanhol extends StatefulWidget {
  @override
  HomePageStateE createState() => HomePageStateE();
}

class HomePageStateE extends State<QuestoesEspanhol> {

  List<String> imagesE = [
    "images/espanhol leitura e interpretação.png",
    "images/espanhol semantica.png",
    "images/estrutura textual e analise de discurso.png",
    "images/genero textual.png",
    "images/espanhol analise de poemas.png",
  ];

  List<String> desE = [
    "Faça questões de Leitura e Interpretação de Textos",
    "Faça questões de Semântica e Domínio Lexical ",
    "Faça questões de Análise de Texto Literário em Prosa",
    "Faça questões de Identificação de Função do Texto",
    "Faça questões de Análise e interpretação de poemas e canções",
  ];

  Widget customcard(String materias, String imagemE, String desE){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => GetJsonESPANHOL(materias),
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
                            imagemE,
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
                    desE,
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
          "Espanhol",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Leitura e Interpretação de Textos ", imagesE[0], desE[0]),
          customcard("Semântica e Domínio Lexical ", imagesE[1], desE[1]),
          customcard("Análise de Texto Literário em Prosa", imagesE[2], desE[2]),
          customcard("Identificação de Função do Texto", imagesE[3], desE[3]),
          customcard("Análise e interpretação de poemas e canções", imagesE[4], desE[4]),
        ],
      ),
    );
  }
}