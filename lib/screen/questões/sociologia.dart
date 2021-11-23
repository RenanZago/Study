import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study/screen/Alternativas/Alternativas_Matematica.dart';

class QuestoesSociologia extends StatefulWidget {
  @override
  HomePageStateM createState() => HomePageStateM();
}

class HomePageStateM extends State<QuestoesSociologia> {

  List<String> imagesM = [
    "images/Matematica_Basica.png",
    "images/Geometria.png",
    "images/Escalas_Razao_e_Proporcao.png",
    "images/Aritmetica.png",
    "images/Graficos_e_Tabelas.png",
    "images/Funcoes.png",
  ];

  List<String> desM = [
    "Faça questões de Matemática Basica",
    "Faça questões de Geometria",
    "Faça questões de Escalas, Razão e Proporção",
    "Faça questões de Aritmética",
    "Faça questões de Gráficos e Tabelas",
    "Faça questões de Funções",
  ];

  Widget customcard(String materias, String imagemM, String desM){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => GetJsonMATEMATICA(materias),
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
                            imagemM,
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
                    desM,
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
          customcard("Matemática Basica", imagesM[0], desM[0]),
          customcard("Geometria", imagesM[1], desM[1]),
          customcard("Escalas, Razão e Proporção", imagesM[2], desM[2]),
          customcard("Aritmética", imagesM[3], desM[3]),
          customcard("Gráficos e Tabelas", imagesM[4], desM[4]),
          customcard("Funções", imagesM[5], desM[5]),
        ],
      ),
    );
  }
}