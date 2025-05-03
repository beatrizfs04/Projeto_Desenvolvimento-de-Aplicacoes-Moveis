import 'package:copia/Classes.dart';
import 'package:copia/Musica/musica.dart';
import 'package:copia/Pages/PaginaPrincipal.dart';
import 'package:copia/Pages/Respiracao.dart';
import 'package:copia/Pages/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Gestor.dart';

class Login2 extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(225, 218, 239, 1),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Center(
          child: SingleChildScrollView(
            child:Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 100,
                        child: IconButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            //Ref_Gestao.Save_Shared_Preferences_STRING('SavedEmail', "");
                            //Ref_Gestao.Save_Shared_Preferences_STRING('SavedPassword', "");
                            Navigator.push(context, MaterialPageRoute( builder: (context) => MyHomePage(title: 'Home')));
                            },
                          icon: Icon(Icons.arrow_circle_left, size: 80, color: Color.fromRGBO(118, 115, 140, 1)),
                        )
                      )
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 70,
                          child: Container(
                            height: 100,
                            child: Classes().CreateText("Terminar\nSessão", 22, [11, 8, 46, 1])
                        ),
                      )
                    )
                  ]
                ),
                Padding(padding: EdgeInsets.all(20)),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: 100,
                        child: Icon(Icons.account_circle_rounded, size: 80, color: Color.fromRGBO(11, 8, 46, 1)),
                      )
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: 200,
                            child: Classes().CreateText(user.email!, 16, [11, 8, 46, 1])
                          ),
                          Container(
                            width: 200,
                            child: Classes().CreateElevatedButton([11, 8, 46, 1], 10, "Editar Perfil", "Brandon", 14, [255, 255, 255, 1], context, Login2()),
                          )
                        ]
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(10)),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Classes().CreateElevatedButton([118, 115, 140, 1], 10, "Página Principal", "Brandon", 18, [255, 255, 255, 1], context, PaginaPrincipal()),
                    Classes().CreateElevatedButton([118, 115, 140, 1], 10, "Musicas", "Brandon", 18, [255, 255, 255, 1], context, musica()),
                    Classes().CreateElevatedButton([118, 115, 140, 1], 10, "Respiração", "Brandon", 18, [255, 255, 255, 1], context, Respiracao()),
                  ]
                ),
                const Padding(padding: EdgeInsets.all(70)),
              ]
            )
          ),
        )
      ),
    );
  }
}
