import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:study/services/authservice.dart';
import 'package:provider/provider.dart';
import 'MeuAplicativo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: MeuAplicativo(),
    ),
  );
}