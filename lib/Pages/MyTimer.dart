import 'package:copia/Classes.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class MyTimer extends StatefulWidget {
  final Duration meditationDuration;

  MyTimer({required this.meditationDuration});

  @override
  _MyTimerPageState createState() => _MyTimerPageState();
}

class _MyTimerPageState extends State<MyTimer> with SingleTickerProviderStateMixin {
  final Color azulEscuro = Color(0xFF0D0A30);
  final Color azulClaro = Colors.blue[300]!;

  late Timer _mainTimer;
  bool _mainTimerIsActive = false;

  late Timer _subTimer;
  int _subSecondsRemaining = 4;
  String _displayText = "INSPIRAR";

  late AnimationController _circleAnimationController;

  int _mainSecondsRemaining = 0;
  double _currentAnimationValue = 0.0;

  @override
  void initState() {
    super.initState();
    _circleAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _circleAnimationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _circleAnimationController.forward();
      }
    });
  }

  String getFormattedTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String formattedMinutes = minutes.toString().padLeft(2, '0');
    String formattedSeconds = remainingSeconds.toString().padLeft(2, '0');
    return '$formattedMinutes:$formattedSeconds';
  }

  void _startMainTimer() {
    if (!_mainTimerIsActive) {
      _mainTimer = Timer.periodic(Duration(seconds: 1), _updateMainTimer);
      _subTimer = Timer.periodic(Duration(seconds: 1), _updateSubTimer);

      _circleAnimationController.forward();

      setState(() {
        _mainTimerIsActive = true;
      });
    } else {
      _mainTimer.cancel();
      _subTimer.cancel();

      _circleAnimationController.stop(canceled: false);

      setState(() {
        _mainTimerIsActive = false;
      });
    }
  }

  void _updateMainTimer(Timer timer) {
    if (_mainTimerIsActive && _mainSecondsRemaining < widget.meditationDuration.inSeconds) {
      setState(() {
        _mainSecondsRemaining++;
        _currentAnimationValue = _circleAnimationController.value;
      });
    } else {
      _mainTimer.cancel();
      _subTimer.cancel();
      setState(() {
        _mainTimerIsActive = false;
        _mainSecondsRemaining = 0;
        _displayText = "INSPIRAR";
        _currentAnimationValue = 0.0;
      });

      _circleAnimationController.stop(canceled: false);
    }
  }
  void _updateSubTimer(Timer timer) {
    if (_subSecondsRemaining > 0) {
      setState(() {
        _subSecondsRemaining--;
      });
    } else {
      if (_displayText == "INSPIRAR") {
        _subSecondsRemaining = 5;  // Alteração de 6 para 5 segundos
        _displayText = "EXPIRAR";
      } else {
        _subSecondsRemaining = 3;  // Alteração de 4 para 3 segundos
        _displayText = "INSPIRAR";
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: azulEscuro,
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: azulEscuro,
          ),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              // Adicionando a seta de retorno
              Positioned(
                top: 1,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    // Adicione a navegação para o respiracaoMenu aqui
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
              Positioned(
                top: 60,
                child: Container(
                  width: 200,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white.withOpacity(0.0),
                  ),
                  child: Center(
                    child: Classes().CreateText(getFormattedTime(
                        widget.meditationDuration.inSeconds - _mainSecondsRemaining), 50, [255, 255, 255, 1]
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 190,
                child: AnimatedBuilder(
                  animation: _circleAnimationController,
                  builder: (context, child) {
                    final double maxCircleSize = 360;
                    final double minCircleSize = 290;
                    double circleSize =
                        minCircleSize + (_circleAnimationController.value * (maxCircleSize - minCircleSize));
                    circleSize = circleSize.clamp(minCircleSize, maxCircleSize);

                    final double position = (maxCircleSize - circleSize) / 2;

                    return Container(
                      width: circleSize,
                      height: circleSize,
                      margin: EdgeInsets.only(bottom: position),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.1),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 230,
                child: Container(
                  width: 280,
                  height: 280,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Classes().CreateText(_displayText, 50, [13, 10, 48, 1]),
                        Classes().CreateText(_subSecondsRemaining.toString(), 20, [13, 10, 48, 1]),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                child: TextButton(
                  onPressed: () {
                    _startMainTimer();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: azulClaro,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                  ),
                  child: Container(
                    width: 200,
                    height: 50,
                    child: Center(
                      child: Classes().CreateText(_mainTimerIsActive ? "PAUSAR" : "INICIAR", 20, [255, 255, 255, 1]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _mainTimer.cancel();
    _subTimer.cancel();
    _circleAnimationController.dispose();
    super.dispose();
  }
}