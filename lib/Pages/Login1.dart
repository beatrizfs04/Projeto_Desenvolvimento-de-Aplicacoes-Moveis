import 'package:copia/Pages/Login2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:core';
import '../Classes.dart';
import '../Gestor.dart';
import 'forgot_pw_page.dart';


class Login1 extends StatelessWidget{
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  Future signIn(String email, String password, BuildContext context) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login2()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(225, 218, 239, 1),
      body: Padding(
        padding: EdgeInsets.all(60),
        child: Center(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Classes().CreateText("Iniciar Sessão", 26, [11, 8, 46, 1]),
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
                    obscureText: true,
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
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap:(){
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context){
                              return ForgotPasswordPage();
                            },
                          ),
                        );
                      },
                      child: const Text(
                          'Forgot your password?',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container (
                height: 60,
                width: 200,
                child: ElevatedButton(
                  onPressed: () async {
                    await signIn(emailController.text.trim(), passwordController.text.trim(), context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(13, 10, 48, 1),
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("SIGN IN",
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
    );
  }
}