import 'dart:math';
import 'package:flutter/material.dart';
import '../Classes.dart';
import '../Musica/musica.dart';
import 'Respiracao.dart';

class PaginaPrincipal extends StatelessWidget {
    final List<String> mensagensDiarias = [
      'A força interior que carregamos é como uma chama que nunca se apaga. Cultiva essa luz, permite que ela ilumine o teu caminho e inspire aqueles à tua volta. Lembra-te, és capaz de superar qualquer desafio que a vida te apresentar.',
      'A alegria não está apenas nos grandes acontecimentos, mas também nos pequenos momentos que preenchem os nossos dias. Valoriza as gargalhadas, os abraços calorosos e as pequenas vitórias, pois são eles que constroem uma vida plena e significativa.',
      'A cada obstáculo superado, descobrimos a nossa resiliência e a capacidade de nos reinventarmos. Encara os desafios como oportunidades de crescimento, aprendizado e fortalecimento. És mais forte do que imaginas.',
      'A beleza da vida reside na diversidade e na variedade de experiências que podemos vivenciar. Abre-te a novas possibilidades, aceita as mudanças com coragem e sabe que, em cada desafio, há uma oportunidade de crescimento e transformação.',
      'A autenticidade é a chave para viver uma vida verdadeiramente feliz. Sê fiel a ti mesmo, abraça as tuas peculiaridades e permite que a tua singularidade brilhe. És único e extraordinário, e o mundo precisa da tua autenticidade.',
    ];

    String textoDiarioAleatorio() {
      Random random = Random();
      int index = random.nextInt(mensagensDiarias.length); //cria um index aleatório
      return mensagensDiarias[index]; //retorna
    }

    @override
    Widget build(BuildContext context) {
      String textoDiario = textoDiarioAleatorio();

      return MaterialApp(
        home: Scaffold(
          backgroundColor: Color(0xFF0D0A30),
          body: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 40.0),
                          child: Text(
                            'Olá, Xavier', //xavier - variável do usuário
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    _buildTable(context), //tabela com os dois botões
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 50.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        constraints: BoxConstraints(maxWidth: 335),
                        padding: EdgeInsets.all(10.0),
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                            ),
                            children: [
                              TextSpan(
                                text: 'Frase do dia\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              TextSpan(
                                text: textoDiario,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned( //positioned pra barra ficar fixa no final da página
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Classes().CreateBottomBar(context),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget _buildTable(BuildContext context) {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 40.0),
          child: Table(
            defaultColumnWidth: FixedColumnWidth(150),
            border: TableBorder.all(color: Colors.transparent),
            children: List.generate(1, (rowIndex) {
              return TableRow(
                children: List.generate(2, (colIndex) {
                  int index = rowIndex * 2 + colIndex;
                  String buttonText;
                  IconData? buttonIcon;
                  var page;
                  switch (index) {
                    case 0:
                      buttonText = 'Meditação';
                      buttonIcon = Icons.self_improvement;
                      page = Respiracao();
                      break;
                    case 1:
                      buttonText = 'Música';
                      buttonIcon = Icons.music_note;
                      page = musica();
                      break;
                    default:
                      buttonText = 'Option ${index + 1}';
                      buttonIcon = null;
                  }
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    child: _buildButton(context, buttonText, buttonIcon, page),
                  );
                }),
              );
            }),
          ),
        ),
      );
    }

    Widget _buildButton(BuildContext context, String text, IconData? iconData, page) {
      return ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          primary: Colors.white.withOpacity(0.5),
          minimumSize: Size(110, 130),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconData != null) // Mostra o ícone se estiver definido
              Icon(
                iconData,
                size: 80,
                color: Colors.white,
              ),
            SizedBox(height: 8),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18, // Ajuste o tamanho da fonte conforme necessário
              ),
            ),
          ],
        ),
      );
    }
  }