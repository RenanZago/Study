import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:study/controllers/BotaoDeNavegacao.dart';
import 'package:study/pages/Configuracao.dart';
import 'package:study/pages/Creditos.dart';
import 'package:study/pages/Estudos.dart';
import 'package:study/pages/Simulados.dart';
import 'package:study/services/authservice.dart';
import 'Materias.dart';

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
          color: Colors.blue,
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Study",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/123.jpeg"),
              ),
              accountName: Text('zago'),
              accountEmail: Text('renanzago1308@gmail.com'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Início'),
              subtitle: Text('Tela de início'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            MyBottomNavigationBar()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              subtitle: Text('Finalizar sessão'),
              onTap: () => context.read<AuthService>().logout(),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuração'),
              subtitle: Text('Ir para as configurações'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Configuracao()));
              },
            ),
            ListTile(
              leading: Icon(Icons.article),
              title: Text('Sobre Nós'),
              subtitle: Text('Veja quem somos'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Creditos()));
              },
            ),
          ],
        ),
      ),
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
