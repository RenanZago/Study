import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study/screen/simulados/simulado_json.dart';

class Simulados extends StatefulWidget {
  const Simulados({Key? key}) : super(key: key);

  @override
  _SimuladosState createState() => _SimuladosState();
}

class _SimuladosState extends State<Simulados> {
  List<String> images = [
    "images/MATEMATICA.png",
    "images/quimica.png",
    "images/fisica.png",
    "images/biologia.png",
    "images/geografia.png",
    "images/historia.png",
    "images/sociologia.png",
    "images/portugues.png",
    "images/ingles.png",
    "images/espanhol.png",
    "images/filosofia.png",
  ];

  List<String> des = [
    "Faça um simulado de matemática\n\nQuestões de:\n\nMatemática Básica\nGeometria\nEscalas\nRazão\nProporção\nArítmetica\nGráficos\nTabelas\nFunções",
    "Faça um simulado de quimica\n\nQuestões de:\n\nQuímica Básica\nFísico-Química\nQuímica Geral\nQuímica Orgânica\nMeio Ambiente\nEnergia",
    "Faça um simulado de fisica\n\nQuestões de:\n\nFísica Básica\nMecânica\nEletricidade e Energia\nOndulatória\nTermologia\nÓptica",
    "Faça um simulado de biologia\n\nQuestões de:\n\nBiologia Básica\nHumanidade e Ambiente\nCitologia\nHistologia e Fisiologia\nFundamentos da Ecologia\nBiotecnologia",
    "Faça um simulado de geografia\n\nQuestões de:\n\nGeografia Agrária\nMeio Ambiente\nQuestões Econômicas e\nGlobalização\nGeografia Física\nGeografia Urbana",
    "Faça um simulado de história\n\nQuestões de:\n\nHistória geral\nIdade Contemporânea\nBrasil Colônia\nBrasil Império\nHistória Política\nPatrimônio Histórico\n-Cultural e Memória",
    "Faça um simulado de sociologia\n\nQuestões de:\n\nMundo do Trabalho\nCultura e Indústria Cultural\nIdeologia\nMeios de Comunicação\nTecnologia\nCultura de Massa\nCidadania",
    "Faça um simulado de portugues\n\nQuestões de:\n\nLeitura e Interpretação de Textos\nEstrutura Textual\nAnálise de Discurso\nLeituras e Artes\nGênero Textual\nLiteratura",
    "Faça um simulado de inglês\n\nQuestões de:\n\nLeitura e Interpretação de Textos\nLeitura e Interpretação de \nCartuns, Tiras e Charges\nDomínio Lexical\nAnálise e Interpretação \nde Poemas e Canções\nIdentificação da Função do Texto",
    "Faça um simulado de espanhol\n\nQuestões de:\n\nLeitura e Interpretação de Textos\nSemântica e Domínio Lexical\nAnálise de Texto Literário em Prosa\nIdentificação de Função do Texto\nAnálise e interpretação de \npoemas e canções",
    "Faça um simulado de filosofia\n\nQuestões de:\n\nÉtica e Justiça\nFilosofia Antiga\nFilosofia Contemporânea\nNatureza do Conhecimento\nFilosofia Moderna",
  ];

  Widget customcard(String materias, String imagem, String des) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13, vertical: 13),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => GetJsonSIMULADO(materias),
          ));
        },
        child: Material(
          color: Colors.blue.shade800,
          elevation: 17.0,
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: 85.0,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      height: 150.0,
                      width: 150.0,
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
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                  ),
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
                    des,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontFamily: "Alike"),
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
          "Simulados",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          customcard("Simulado Matemática", images[0], des[0]),
          customcard("Simulado Química", images[1], des[1]),
          customcard("Simulado Física", images[2], des[2]),
          customcard("Simulado Biologia", images[3], des[3]),
          customcard("Simulado Geografia", images[4], des[4]),
          customcard("Simulado História", images[5], des[5]),
          customcard("Simulado Sociologia", images[6], des[6]),
          customcard("Simulado Português", images[7], des[7]),
          customcard("Simulado Inglês", images[8], des[8]),
          customcard("Simulado Espanhol", images[9], des[9]),
          customcard("Simulado Filosofia", images[10], des[10]),
        ],
      ),
    );
  }
}
