import 'package:copia/Pages/Login2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:core';
import '../Classes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignIn extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final nomeController = TextEditingController();
    final apelidoController = TextEditingController();
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final emailController = TextEditingController();

    Future signUp() async{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
      );
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(225, 218, 239, 1),
      body: Padding(
        padding: EdgeInsets.all(60),
        child: Center(
          child:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Classes().CreateText("Cria o teu perfil", 26, [11, 8, 46, 1]),
                const Icon(Icons.account_circle_rounded, size: 80, color: Color.fromRGBO(11, 8, 46, 1)),
                const Padding(padding: EdgeInsets.all(10)),

                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: emailController,
                      style: const TextStyle(
                        color: Color.fromRGBO(11, 8, 46, 1),
                        fontSize: 18,
                      ),
                      decoration: const InputDecoration(
                          hintText: 'Email'
                      ),
                    )
                ),

                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: nomeController,
                      style: const TextStyle(
                        color: Color.fromRGBO(11, 8, 46, 1),
                        fontSize: 18,
                      ),
                      decoration: const InputDecoration(
                          hintText: 'Nome'
                      ),
                    )
                ),

                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: apelidoController,
                      style: const TextStyle(
                        color: Color.fromRGBO(11, 8, 46, 1),
                        fontSize: 18,
                      ),
                      decoration: const InputDecoration(
                          hintText: 'Apelido'
                      ),
                    )
                ),

                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: usernameController,
                      style: const TextStyle(
                        color: Color.fromRGBO(11, 8, 46, 1),
                        fontSize: 18,
                      ),
                      decoration: const InputDecoration(
                          hintText: 'Username'
                      ),
                    )
                ),

                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: passwordController,
                      style: const TextStyle(
                        color: Color.fromRGBO(11, 8, 46, 1),
                        fontSize: 18,
                      ),
                      decoration: const InputDecoration(
                          hintText: 'Password'
                      ),
                    )
                ),

                const Padding(padding: EdgeInsets.all(20)),

                Container (
                  height: 60,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () async {
                      signUp();
                      try {
                        await FirebaseFirestore.instance.collection('users').add({
                            'name': nomeController.text.trim(),
                            'apelido': apelidoController.text.trim(),
                            'username': usernameController.text.trim(),
                            'email': emailController.text.trim(),
                        });
                      } on Exception catch (e) {
                        print(e);
                      }
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login2()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(13, 10, 48, 1),
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("SIGN UP",
                      style: TextStyle(
                        fontFamily: "Brandon",
                        fontSize: 26,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}