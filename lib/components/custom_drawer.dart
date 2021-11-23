import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:study/screen/configuracao.dart';
import 'package:study/screen/quem_somos.dart';
import 'package:study/services/auth_check.dart';
import 'package:study/services/authservice.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/123.jpeg"),
              ),
              accountName: Text(
                'Zago',
                style: TextStyle(
                  fontFamily: "Quando",
                ),
              ),
              accountEmail: Text(
                'renanzago1308@gmail.com',
                style: TextStyle(
                  fontFamily: "Quando",
                ),
              )),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Início',
              style: TextStyle(
                fontFamily: "Quando",
              ),
            ),
            subtitle: Text(
              'Ir para o início',
              style: TextStyle(
                fontFamily: "Quando",
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => AuthCheck()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Logout',
              style: TextStyle(
                fontFamily: "Quando",
              ),
            ),
            subtitle: Text(
              'Finalizar sessão',
              style: TextStyle(
                fontFamily: "Quando",
              ),
            ),
            onTap: () => context.read<AuthService>().logout(),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Configuração',
              style: TextStyle(
                fontFamily: "Quando",
              ),
            ),
            subtitle: Text(
              'Ir para as configurações',
              style: TextStyle(
                fontFamily: "Quando",
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Configuracao()));
            },
          ),
          ListTile(
            leading: Icon(Icons.article),
            title: Text(
              'Sobre Nós',
              style: TextStyle(
                fontFamily: "Quando",
              ),
            ),
            subtitle: Text(
              'Veja quem somos',
              style: TextStyle(
                fontFamily: "Quando",
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Creditos()));
            },
          ),
        ],
      ),
    );
  }
}
