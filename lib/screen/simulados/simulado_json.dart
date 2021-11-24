import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study/components/resultado_questoes.dart';

// ignore: must_be_immutable
class GetJsonSIMULADO extends StatelessWidget {
  late String materias;
  GetJsonSIMULADO(this.materias);
  late String assettoload;

  setasset() {
    if (materias == "Simulado Matemática") {
      assettoload = "assets/matematica_simulado.json";
    } else if (materias == "Simulado Química") {
      assettoload = "assets/quimica_basica.json";
    } else if (materias == "Simulado Física") {
      assettoload = "assets/fisica_basica.json";
    } else if (materias == "Simulado Biologia") {
      assettoload = "assets/biologia_simulado.json";
    } else if (materias == "Simulado Geografia") {
      assettoload = "assets/geografia_agraria.json";
      } else if (materias == "Simulado História") {
      assettoload = "assets/brasil_colonia.json";
      } else if (materias == "Simulado Sociologia") {
      assettoload = "assets/etica_e_justica.json";
      } else if (materias == "Simulado Português") {
      assettoload = "assets/literatura.json";
      } else if (materias == "Simulado Inglês") {
      assettoload = "assets/ingles_leitura_e_interpretacao_textual.json";
      } else if (materias == "Simulado Espanhol") {
      assettoload = "assets/espanhol_leitura_e_interpretacao.json";
    } else {
      assettoload = "assets/cultura_e_industria_cultural.json";
    }
  }

  @override
  Widget build(BuildContext context) {
    setasset();
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString(assettoload, cache: false),
      builder: (context, snapshot) {
        List? mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text(
                "Loading",
              ),
            ),
          );
        } else {
          return Quizpage(mydata: mydata);
        }
      },
    );
  }
}

class Quizpage extends StatefulWidget {
  final List mydata;

  Quizpage({Key? key, required this.mydata}) : super(key: key);
  @override
  QuizpageState createState() => QuizpageState(mydata);
}

class QuizpageState extends State<Quizpage> {
  final List mydata;
  QuizpageState(this.mydata);

  Color colortoshow = Colors.blue;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int pontos = 0;
  int i = 1;
  bool disableAnswer = false;
  int j = 1;
  int timer = 60;
  String showtimer = "60";
  // ignore: non_constant_identifier_names
  var random_array;

  Map<String, Color> btncolor = {
    "a": Colors.blue,
    "b": Colors.blue,
    "c": Colors.blue,
    "d": Colors.blue,
  };

  bool canceltimer = false;

  genrandomarray() {
    var distinctIds = [];
    var rand = new Random();
    // ignore: unused_local_variable
    for (int i = 0;;) {
      distinctIds.add(rand.nextInt(60) + 1);
      random_array = distinctIds.toSet().toList();
      if (random_array.length < 60) {
        continue;
      } else {
        break;
      }
    }
    print(random_array);
  }

  @override
  void initState() {
    starttimer();
    genrandomarray();
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextquestion() {
    canceltimer = false;
    timer = 60;
    setState(() {
      if (j < 60) {
        i = random_array[j];
        j++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ResultPage(pontos: pontos),
        ));
      }
      btncolor["a"] = Colors.blue;
      btncolor["b"] = Colors.blue;
      btncolor["c"] = Colors.blue;
      btncolor["d"] = Colors.blue;
      disableAnswer = false;
    });
    starttimer();
  }

  void checkanswer(String k) {
    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      pontos = pontos + 1;
      colortoshow = right;
    } else {
      colortoshow = wrong;
    }
    setState(() {
      btncolor[k] = colortoshow;
      canceltimer = true;
      disableAnswer = true;
    });
    Timer(Duration(seconds: 2), nextquestion);
  }

  Widget choicebutton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: Text(
          mydata[1][i.toString()][k],
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Alike",
            fontSize: 16.0,
          ),
        ),
        color: btncolor[k],
        minWidth: 200.0,
        height: 45.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue.shade800,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(14.0),
              alignment: Alignment.topLeft,
              child: Text(
                mydata[0][i.toString()],
                style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: "Quando",
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: AbsorbPointer(
              absorbing: disableAnswer,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    choicebutton('a'),
                    choicebutton('b'),
                    choicebutton('c'),
                    choicebutton('d'),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.topCenter,
              child: Center(
                child: Text(
                  showtimer,
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Times New Roman',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
