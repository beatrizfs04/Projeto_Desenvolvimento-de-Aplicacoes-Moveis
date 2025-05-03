import 'package:copia/Classes.dart';
import 'package:copia/Pages/Login2.dart';
import 'package:flutter/material.dart';

class Respiracao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D0A30),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 65.0),
                      child: Classes().CreateText('Respiração', 30, [255, 255, 255, 1]),
                ),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 2.0, bottom: 4.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                constraints: BoxConstraints(maxWidth: 335),
                padding: EdgeInsets.all(10.0),
                child: Classes().CreateText('Este exercício de respiração consiste em inspirar profundamente por 4'
                    ' segundos e expirar lentamente por 6 segundos. Deve ser praticado regularmente para '
                    'manter uma boa saúde', 21, [255, 255, 255, 1]),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40.0), // Adiciona padding acima do texto
                  child: Classes().CreateText('Escolha a duração desejada:', 25, [255, 255, 255, 1]),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Classes().CreateTemporizador(context, "30 s", 30),
              ),
            ),
            Spacer(), // Adicionado o Spacer() para preencher o espaço disponível
            Classes().CreateBottomBar(context),
          ],
        ),
      ),
    );
  }
}