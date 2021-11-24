import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study/screen/alternativas/alternativas_filosofia.dart';

class QuestoesFilosofia extends StatefulWidget {
  @override
  HomePageStateM createState() => HomePageStateM();
}

class HomePageStateM extends State<QuestoesFilosofia> {

  List<String> imagesF = [
    "images/etica e justiça.png",
    "images/filosofia antiga.png",
    "images/filosofia contemporanea.png",
    "images/natureza do conhecimento.png",
    "images/filosofia moderna.png",

  ];

  List<String> desF = [
    "Faça questões de Ética e Justiça",
    "Faça questões de Filosofia Antiga",
    "Faça questões de Filosofia Contemporânea",
    "Faça questões de Natureza do Conhecimento",
    "Faça questões de Filosofia Moderna",
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
            builder: (context) => GetJsonFILOSOFIA(materias),
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
          "Filosofia",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Ética e Justiça", imagesF[0], desF[0]),
          customcard("Filosofia Antiga", imagesF[1], desF[1]),
          customcard("Filosofia Contemporânea", imagesF[2], desF[2]),
          customcard("Natureza do Conhecimento", imagesF[3], desF[3]),
          customcard("Filosofia Moderna", imagesF[4], desF[4]),
        ],
      ),
    );
  }
}