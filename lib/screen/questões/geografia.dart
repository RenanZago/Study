import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study/screen/alternativas/alternativas_geografia.dart';

class QuestoesGeografia extends StatefulWidget {
  @override
  HomePageStateG createState() => HomePageStateG();
}

class HomePageStateG extends State<QuestoesGeografia> {

  List<String> imagesG = [
    "images/geografia agrária.png",
    "images/meio ambiente.png",
    "images/questoes economicas e globalização.png",
    "images/geografia fisica.png",
    "images/geografia urbana.png",
  ];

  List<String> desG = [
    "Faça questões de Geografia Agrária",
    "Faça questões de Meio Ambiente",
    "Faça questões de Globalização",
    "Faça questões de Geografia Física",
    "Faça questões de Geografia Urbana",
  ];

  Widget customcard(String materias, String imagemG, String desG){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => GetJsonGEOGRAFIA(materias),
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
                            imagemG,
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
                    desG,
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
          "Geografia",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Geografia Agrária", imagesG[0], desG[0]),
          customcard("Meio Ambiente", imagesG[1], desG[1]),
          customcard("Globalização", imagesG[2], desG[2]),
          customcard("Geografia Física", imagesG[3], desG[3]),
          customcard("Geografia Urbana", imagesG[4], desG[4]),
        ],
      ),
    );
  }
}