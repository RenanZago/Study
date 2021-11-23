import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study/screen/Alternativas/Alternativas_Fisica.dart';


class QuestoesFisica extends StatefulWidget {
  @override
  HomePageStateM createState() => HomePageStateM();
}

class HomePageStateM extends State<QuestoesFisica> {

  List<String> imagesF = [
    "images/Fisica_Basica.png",
    "images/Mecanica.png",
    "images/Eletrecidade_e_Energia.png",
    "images/Ondulatoria.png",
    "images/Termologia.png",
    "images/Optica.png",
  ];

  List<String> desF = [
    "Faça questões de Física Basica",
    "Faça questões de Mecânica",
    "Faça questões de Eletricidade e Energia",
    "Faça questões de Ondulatória",
    "Faça questões de Termologia",
    "Faça questões de Óptica",
  ];

  Widget customcard(String materias, String imagemF, String desF){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => GetJsonFISICA(materias),
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
                            imagemF,
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
                    desF,
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
          "Física",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Física Basica", imagesF[0], desF[0]),
          customcard("Mecânica", imagesF[1], desF[1]),
          customcard("Eletricidade e Energia", imagesF[2], desF[2]),
          customcard("Ondulatória", imagesF[3], desF[3]),
          customcard("Termologia", imagesF[4], desF[4]),
          customcard("Óptica", imagesF[5], desF[5]),
        ],
      ),
    );
  }
}