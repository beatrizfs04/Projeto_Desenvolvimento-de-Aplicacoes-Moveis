import 'package:copia/Pages/SignIn.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import '../Classes.dart';
import '../Gestor.dart';
import 'Login1.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import '../main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  MainPage();
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Serene',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("resources/imagens/PaginaInicial.png"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 555, width: 500,),
            Column (
              children: [
                const Padding(padding: EdgeInsets.all(10)),
                Container(
                  height: 45,
                  width: 155,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [Classes().CreateBoxShadow([0,0,0,0.5], [0, 4], 10)],
                  ),
                  child: Classes().CreateElevatedButton(
                      [196, 181, 224, 1], 10, "LOGIN", "Brandon", 18, [255, 255, 255, 1], context, Login1()
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                Container(
                  height: 45,
                  width: 155,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [Classes().CreateBoxShadow([0,0,0,0.5], [0, 4], 10)],
                  ),
                  child: Classes().CreateElevatedButton(
                      [196, 181, 224, 1], 10, "SIGN IN", "Brandon", 18, [255, 255, 255, 1], context, SignIn()
                  ),
                )
              ]
            )
          ]
        ),
      ),
    );
  }
}