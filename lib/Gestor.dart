import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Geral.dart';

class Gestao {
  final String Nome_APP;

  Geral DEFINICOES = Geral("Definições");


  // VER https://www.macoratti.net/19/11/flut_shapref1.htm
  // https://medium.flutterdevs.com/using-sharedpreferences-in-flutter-251755f07127
  // https://pub.dev/packages/shared_preferences
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  Gestao(this.Nome_APP) {}

  void Load() async
  {
    DEFINICOES.Add("", "");
    DEFINICOES.Add("", "");
    DEFINICOES.Add("", "");
    DEFINICOES.Add("", "");
    DEFINICOES.Add("", "");
    DEFINICOES.Add("", "");
    DEFINICOES.Add("", "");
    DEFINICOES.Add("", "");
    DEFINICOES.Add("", "");
    DEFINICOES.Add("", "");
    DEFINICOES.Add("", "");
    DEFINICOES.Add("", "");
    DEFINICOES.Add("", "");

    String? EmailGuardado = await Get_SharedPreferences_STRING('EmailGuardado');
    if (EmailGuardado != null) {
      Save_Shared_Preferences_STRING('EmailGuardado', EmailGuardado);
    }
  }
  //--------------------------------------
  String GetDefinicao(String key, String def)
  {
    return DEFINICOES.Get(key, def);
  }
  //--------------------------------------
  String GetDadosUtilizadores()
  {
    return "Dados dos Utilizadores";
  }
  //--------------------------------------
  Future<int?> Get_SharedPreferences_INT(String TAG) async
  {
    final SharedPreferences pfs = await prefs;
    if (pfs == null) return 0;
    if (pfs.containsKey(TAG)) {
      return pfs.getInt(TAG);
    }
    return 0;
  }
  //--------------------------------------
  Future<String?> Get_SharedPreferences_STRING(String TAG) async
  {
    final SharedPreferences pfs = await prefs;
    if (pfs == null) return "??";
    if (pfs.containsKey(TAG)) {
      return pfs.getString(TAG);
    }
    return "??";
  }
  //---------

  void Save_Shared_Preferences_INT(String TAG, int Valor) async
  {
    final SharedPreferences pfs = await prefs;
    pfs.setInt(TAG, Valor);
  }
  //--------------------------------------
  void Save_Shared_Preferences_STRING(String TAG, String Valor) async
  {
    final SharedPreferences pfs = await prefs;
    pfs.setString(TAG, Valor);
  }
}