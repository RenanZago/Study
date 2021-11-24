import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study/components/resultado_questoes.dart';

//ignore: must_be_immutable
class GetJsonINGLES extends StatelessWidget {
  late String materias;
  GetJsonINGLES(this.materias);
  late String assettoload;

  setasset() {
    if (materias == "Matemática Basica") {
      assettoload = "assets/matematica_basica.json";
    } else {
      assettoload = "assets/ingles_leitura_e_interpretacao_textual.json";
    }
  }

  @override
  Widget build(BuildContext context) {
    setasset();
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString(assettoload, cache: true),
      builder: (context, snapshot) {
        List? mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text(
                "Carregando",
              ),
            ),
          );
        } else {
          return QuizPage(mydata: mydata);
        }
      },
    );
  }
}

class QuizPage extends StatefulWidget {
  final List mydata;

  QuizPage({Key? key, required this.mydata}) : super(key: key);
  @override
  QuizPageState createState() => QuizPageState(mydata);
}

class QuizPageState extends State<QuizPage> {
  final List mydata;
  QuizPageState(this.mydata);

  Color colortoshow = Colors.blue;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int pontos = 0;
  int i = 1; //PRIMEIRA QUESTÃO
  bool disableAnswer = false;
  int j = 1; //de qnts em qnts questões vai
  var randomarray;

  Map<String, Color> btncolor = {
    "a": Colors.blue.shade800,
    "b": Colors.blue.shade800,
    "c": Colors.blue.shade800,
    "d": Colors.blue.shade800,
  };

  genrandomarray() {
    var distinctIds = [];
    var rand = new Random();
    // ignore: unused_local_variable
    for (int i = 0;;) {
      distinctIds.add(rand.nextInt(10) + 1);
      randomarray = distinctIds.toSet().toList();
      if (randomarray.length < 10) {
        //NUMERO DE QUESTÕES
        continue;
      } else {
        break;
      }
    }
    print(randomarray);
  }

  @override
  void initState() {
    genrandomarray();
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void nextquestion() {
    setState(() {
      if (j < 10) {
        i = randomarray[j];
        j++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ResultPage(pontos: pontos),
        ));
      }
      btncolor["a"] = Colors.blue.shade800;
      btncolor["b"] = Colors.blue.shade800;
      btncolor["c"] = Colors.blue.shade800;
      btncolor["d"] = Colors.blue.shade800;
      disableAnswer = false;
    });
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
      disableAnswer = true;
    });
    Timer(Duration(seconds: 1), nextquestion);
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
        ],
      ),
    );
  }
}