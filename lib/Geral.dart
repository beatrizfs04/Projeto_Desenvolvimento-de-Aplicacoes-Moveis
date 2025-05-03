import 'dart:core';

class Geral
{
  Map<String,String> Dados = Map();
  final String NomeObjecto;
  //----------------------------------------
  Geral(this.NomeObjecto);
  //----------------------------------------
  String GetNome() { return NomeObjecto; }
  //----------------------------------------
  Map<String,String> Get_All_Dados() { return Dados; }
  //----------------------------------------
  void Add(String key, String valor) {
    Dados[key] = valor;
  }
  //----------------------------------------
  String Get(String key, String def) {
    if (Dados.containsKey(key)) {
      return Dados[key].toString();
    }
    return def;
  }
  //----------------------------------------
  Iterable<String> GetKeys()
  {
    return Dados.keys;
  }
  //----------------------------------------
  String ToString(int N) {
    String RES = "ObjectoGeral: " + NomeObjecto!;
    Iterable<String> listaKeys = Dados.keys;
    for (String key in listaKeys)
      RES += "\tDados[" + key + "]=" + Dados[key]!;
    return RES;
  }
//----------------------------------------
}