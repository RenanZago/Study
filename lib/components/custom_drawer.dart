import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:study/screen/configuracao.dart';
import 'package:study/screen/quem_somos.dart';
import 'package:study/services/authservice.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Drawer(
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
    );
  }
}
    