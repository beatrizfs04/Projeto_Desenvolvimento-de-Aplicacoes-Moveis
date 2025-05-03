import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Musica/meditacao.dart';
import 'Pages/Login2.dart';
import 'Musica/musica.dart';
import 'Pages/MyTimer.dart';
import 'Pages/PaginaPrincipal.dart';
import 'Pages/Respiracao.dart';
import 'Pages/SignIn.dart';
class Classes {

  Widget CreateElevatedButton(List<double> backcolor, double radius,
      String buttonText, String fontFamily, double fontSize,
      List<double> textcolor, BuildContext context, page) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(
            backcolor[0].toInt(), backcolor[1].toInt(), backcolor[2].toInt(),
            backcolor[3]),
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: Text(buttonText,
        style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          color: Color.fromRGBO(
              textcolor[0].toInt(), textcolor[1].toInt(), textcolor[2].toInt(),
              textcolor[3]),
        ),
      ),
    );
  }

  Widget CreateFormText(List<double> backcolor1, double fontSize1,
      String labelText, List<double> backcolor2, double fontSize2) {
    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.text,
      style: TextStyle(
        color: Color.fromRGBO(
            backcolor1[0].toInt(), backcolor1[1].toInt(), backcolor1[2].toInt(),
            backcolor1[3]),
        fontSize: fontSize1,
      ),
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Color.fromRGBO(backcolor2[0].toInt(), backcolor2[1].toInt(),
                backcolor2[2].toInt(), backcolor2[3]),
            fontSize: fontSize2,
          )
      ),
    );
  }

  Widget CreateText(String text, double fontSize, List<double> colorback) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: Color.fromRGBO(
            colorback[0].toInt(), colorback[1].toInt(), colorback[2].toInt(),
            colorback[3]),
      ),
    );
  }

  BoxShadow CreateBoxShadow(List<double> color, List<double> offset,
      double radius) {
    return BoxShadow(
      color: Color.fromRGBO(
          color[0].toInt(), color[1].toInt(), color[2].toInt(), color[3]),
      offset: Offset(offset[0], offset[1]),
      blurRadius: radius,
    );
  }

  Widget CreateBottomBar(BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PaginaPrincipal()));
              },
              icon: Icon(
                Icons.home,
                size: 39.0,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Respiracao()));
              },
              icon: Icon(
                Icons.self_improvement,
                size: 39.0,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => musica()));
              },
              icon: Icon(
                Icons.music_note,
                size: 39.0,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login2()));
              },
              icon: Icon(
                Icons.person,
                size: 39.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
  }

  Widget CreateMusicBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Meditacao()));
            },
            icon: Icon(
              Icons.self_improvement,
              size: 39.0,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => musica()));
            },
            icon: Icon(
              Icons.music_note,
              size: 39.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget CreateTemporizador(BuildContext context, String textTime, int time) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 20.0), // Ajuste a margem superior aqui
        child: Table(
          defaultColumnWidth: FixedColumnWidth(120),
          border: TableBorder.all(color: Colors.transparent),
          children: List.generate(2, (rowIndex) {
            return TableRow(
              children: List.generate(3, (colIndex) {
                int index = rowIndex * 3 + colIndex;
                String buttonText = index == 0 ? textTime : '${index * 5} min';
                Duration duration = index == 0
                    ? Duration(seconds: time)
                    : Duration(minutes: index * 5);
                return Container(
                  padding: EdgeInsets.all(8),
                  child: buildButton(context, buttonText, duration),
                );
              }),
            );
          }),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, String text, Duration duration) {
    return Container(
        height: 55,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyTimer(meditationDuration: duration),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(0.5),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      );
  }


}