import 'package:flutter/material.dart';
import 'package:study/controllers/BotaoDeNavegacao.dart';
import 'package:study/pages/Login.dart';
import 'Configuracao.dart';
import 'Creditos.dart';

class Slaoq extends StatefulWidget {
  @override
  _SlaoqState createState() => _SlaoqState();
}

class _SlaoqState extends State<Slaoq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Anotações",
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
              accountEmail: Text('zago@gmail'),
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage()));
              },
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
      body: Center(
        child: Text('Aqui mostra as anotações'),
      ),
    );
  }
}
