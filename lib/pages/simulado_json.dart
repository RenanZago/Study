import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study/components/Resultado.dart';

class GetJsonSIMULADO extends StatelessWidget {
  late String materias;
  GetJsonSIMULADO(this.materias);
  late String assettoload;

  setasset() {
    if (materias == "Simulado Matemática") {
      assettoload = "assets/matematica_simulado.json";
    } else if (materias == "Mecânica") {
      assettoload = "assets/mecanica.json";
    } else if (materias == "Escalas, Razão e Proporção") {
      assettoload = "assets/escalas.json";
    } else if (materias == "Aritmética") {
      assettoload = "assets/aritmetica.json";
    } else if (materias == "Gráficos e Tabelas") {
      assettoload = "assets/graficos.json";
    } else {
      assettoload = "assets/funcoes.json";
    }
  }

  @override
  Widget build(BuildContext context) {
    setasset();
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString(assettoload, cache: false),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        // ignore: unnecessary_null_comparison
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text(
                "Loading",
              ),
            ),
          );
        } else {
          return quizpage(mydata: mydata);
        }
      },
    );
  }
}

class quizpage extends StatefulWidget {
  final List mydata;

  quizpage({Key? key, required this.mydata}) : super(key: key);
  @override
  _quizpageState createState() => _quizpageState(mydata);
}

class _quizpageState extends State<quizpage> {
  final List mydata;
  _quizpageState(this.mydata);

  Color colortoshow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int pontos = 0;
  int i = 1;
  bool disableAnswer = false;
  // extra varibale to iterate
  int j = 1;
  int timer = 45;
  String showtimer = "45";
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
    timer = 45;
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
          maxLines: 1,
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
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                mydata[0][i.toString()],
                style: TextStyle(
                  fontSize: 16.0,
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
