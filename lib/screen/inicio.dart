import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study/components/custom_drawer.dart';
import 'package:study/screen/estudos.dart';
import 'package:study/screen/simulado/simulados.dart';
import 'materias.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    "images/Questões.png",
    "images/Simulados.png",
    "images/Estudos.png",
  ];
  @override
  // ignore: override_on_non_overriding_member
  Widget card(String telas, String imagem) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 15.0, //de um pro outro card
        horizontal: 15.0,
      ),
      child: InkWell(
        onTap: () {
          if (telas == 'Questões')
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Questoes()));
          if (telas == 'Simulados')
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Simulados()));
          if (telas == 'Estudos')
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Estudos()));
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
                    vertical: 27.0,
                  ),
                  child: Material(
                    elevation: 8.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      height: 90.0,
                      width: 90.0,
                      child: ClipPath(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            imagem,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      telas,
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                        fontFamily: "Quando",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
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
        centerTitle: true,
        title: Text(
          'Study',
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      drawer: CustomDrawer(),
      body: ListView(
        children: <Widget>[
          card("Questões", images[0]),
          card("Simulados", images[1]),
          card("Estudos", images[2]),
        ],
      ),
    );
  }
}
