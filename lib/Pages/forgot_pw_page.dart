import 'package:copia/PAges/Login1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    return Scaffold(
        backgroundColor: Color.fromRGBO(225, 218, 239, 1),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 100,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute( builder: (context) => Login1()));
                      },
                      icon: Icon(Icons.arrow_circle_left, size: 80, color: Color.fromRGBO(118, 115, 140, 1)),
                    )
                ),
                Padding(padding: EdgeInsets.all(10)),
                const Text(
                    'Enter your email and we will send you a password reset link:',
                    style: TextStyle(
                      color: Color.fromRGBO(11, 8, 46, 1),
                      fontSize: 13,
                    ),
                ),
                TextField(
                  controller: emailController,
                  style: const TextStyle(
                    color: Color.fromRGBO(11, 8, 46, 1),
                    fontSize: 18,
                  ),
                  decoration: const InputDecoration(
                      hintText: 'Email'
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                MaterialButton(
                  onPressed: () async{
                    try {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                          email: emailController.text.trim(),
                      );
                      showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            content: Text('Password reset link sent!\n Check your email.'),
                          );
                        },
                      );
                    } on FirebaseAuthException catch (e) {
                      print(e);
                      showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            content: Text(e.toString()),
                          );
                        },
                      );
                    }
                  },
                  child: Text(
                      'Reset Password',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color.fromRGBO(11, 8, 46, 0.5),
                )
              ]
            )
          )
        )
    );
  }
}
