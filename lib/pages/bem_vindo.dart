import 'package:flutter/material.dart';
import 'package:study/auth_check.dart';

class BemVindo extends StatelessWidget {
  static String tag = 'bem_vindo';

  @override
  Widget build(BuildContext context) {
    final alucard = Hero(
      tag: 'hero',
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 130.0),
          child: CircleAvatar(
            radius: 72.0,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('images/123.jpeg'),
          ),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          'Bem-vindo!',
          style: TextStyle(fontSize: 28.0, color: Colors.white),
        ),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(25.0),
      child: Center(
        child: Text(
          'O gato te deseja sorte nessa nova jornada de aprendizado, blablablçablablablablablablablabalbalanhafjqafwyqfwqhfgjafyhjafwyh',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
    );

    final bottom = Center(
      child: Column(
        children: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => AuthCheck(),
                ),
              );
            },
            child: const Text('Continuar'),
          ),
        ],
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: ListView(
        children: <Widget>[alucard, welcome, lorem, bottom],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}
