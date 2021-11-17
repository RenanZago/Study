import 'package:flutter/material.dart';
import 'package:study/components/bot%C3%A3o_de_navega%C3%A7%C3%A3o.dart';

// ignore: must_be_immutable
class ResultPage extends StatefulWidget {
  int pontos;
  ResultPage({Key? key , required this.pontos}) : super(key : key);
  @override
  ResultPageState createState() => ResultPageState(pontos);
}

class ResultPageState extends State<ResultPage> {

  List<String> imagens = [
    "images/success.jpg",
    "images/good.jpg",
    "images/bad.jpg",
  ];

  late String mensagem; //TESTAR ISSO PRA COLOCAR IMAGENS
  late String imagem;

  @override
  void initState(){
    if(pontos < 5){
      imagem = imagens[2];
      mensagem = "Você deveria se esforçar mais...\n" + "Você marcou $pontos pontos";
    }else if(pontos < 7){
      imagem = imagens[1];
      mensagem = "Você pode melhorar...\n" + "Você marcou $pontos pontos";
    }else{
      imagem = imagens[0];
      mensagem = "Você foi muito bem!!!\n" + "Você marcou $pontos pontos";
    }
    super.initState();
  }

  int pontos;
  ResultPageState(this.pontos);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text(
          "Resultado",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Material(
              elevation: 10.0,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        width: 300.0,
                        height: 300.0,
                        child: ClipRect(
                          child: Image(
                            image: AssetImage(
                              imagem,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 15.0,
                      ),
                      child: Center(
                      child: Text(
                        mensagem,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: "Quando",
                        ),
                      ),
                    )
                    ),
                  ],
                ),
              ),
            ),            
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => MyBottomNavigationBar(),
                    ));
                  },
                  child: Text(
                    "Continuar",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}