import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study/screen/alternativas/alternativas_historia.dart';

class QuestoesHistoria extends StatefulWidget {
  @override
  HomePageStateH createState() => HomePageStateH();
}

class HomePageStateH extends State<QuestoesHistoria> {
  List<String> imagesH = [
    "images/historia.png",
    "images/brasil colônia.png",
    "images/brasil imperio.png",
    "images/história politica.png",
    "images/patrimonio historico.png",
  ];

  List<String> desH = [
    "Faça questões de Idade Contemporânea",
    "Faça questões de Brasil Colônia",
    "Faça questões de Brasil Império",
    "Faça questões de História Política",
    "Faça questões de Patrimônio Histórico-Cultural e Memória",
  ];


  Widget customcard(String materias, String imagemH, String desH) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => GetJsonHISTORIA(materias),
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
                            imagemH,
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
                    desH,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontFamily: "Alike"),
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
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text(
          "História",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Idade Contemporânea", imagesH[0], desH[0]),
          customcard("Brasil Colônia", imagesH[1], desH[1]),
          customcard("Brasil Império", imagesH[2], desH[2]),
          customcard("História Política", imagesH[3], desH[3]),
          customcard("Patrimônio Histórico-Cultural", imagesH[4], desH[4]),
        ],
      ),
    );
  }
}
