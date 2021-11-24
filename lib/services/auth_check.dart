
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study/components/bot%C3%A3o_de_navega%C3%A7%C3%A3o.dart';
import 'package:study/screen/login/login.dart';
import 'authservice.dart';

class AuthCheck extends StatefulWidget {
  AuthCheck({Key? key}) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading)
      return loading();
    else if (auth.usuario == null)
      return LoginPage();
    else
      return MyBottomNavigationBar();
  } 

  loading() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}