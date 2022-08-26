
import 'package:flutter/material.dart';

//==========================================================
/// DEVUELVE PORCIENTO DE ANCHO DE LA PANTALLA
//==========================================================
double porcientoW(BuildContext? _context, double _valor ){
  if (_context != null) {
    final size = MediaQuery.of(_context).size;
    return ((size.width/100) * _valor);
  } else {
    return 0;
  }
}

//==========================================================
/// DEVUELVE PORCIENTO DE ALTO DE LA PANTALLA
//==========================================================
double porcientoH(BuildContext? _context, double _valor ){
  if (_context != null) {
    final size = MediaQuery.of(_context).size;
    return ((size.height/100) * _valor);
  } else {
    return 0;
  }
}

//==========================================================
/// DEVUELVE COLOR EN HEXADECIMAL
//==========================================================
Color hexToColor(String _code) => Color(int.parse(_code.substring(1, 7), radix: 16) + 0xFF000000);

//==========================================================
/// VERIFICA SI EL EMAIL ES VALIDO
//==========================================================
bool validarEmail(String _email) {
  Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern.toString());
  return (regExp.hasMatch(_email)) ? true : false;
}

//==========================================================
/// VALIDA QUE EXISTA AL MENOS UNA LETRA MAYUSCULA
//==========================================================
bool validateLetterUpperCase(String value){
  String  pattern = r'[A-Z]';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

//==========================================================
/// VALIDA QUE CONTENGA AL MENOS UN NÚMERO
//==========================================================
bool validateContainsNumber(String value){
  String  pattern = r'[0-9]';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

//==========================================================
/// VALIDA QUE CONTENGA SOLO NÚMEROS
//==========================================================
bool validateOnlyNumbers(String value){
  String  pattern = r'(^[0-9]{1,3}$|^[0-9]{1,3}\.[0-9]{1,2}$)';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

/// Valida que contenga al menos un caracter especial
//==========================================================
/// VALIDA QUE CONTENGA AL MENOS UN CARACTER ESPECIAL
//==========================================================
bool validateSpecialCharacter(String value){
  String  pattern = r'[!@#$%^&*(),.?":{}|<>/]';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

//==========================================================
/// INFO MESSAGE
//==========================================================
void msginfo( msg ) => print('✅ '+ msg.toString() + ' ✅');

//==========================================================
/// WARNING MESSAGE
//==========================================================
void msgwarn( msg ) => print('🚧 ' + msg.toString() +' 🚧');

//==========================================================
/// ERROR MESSAGE
//==========================================================
void msgerror( msg ) => print('🛑 '+ msg.toString() + ' 🛑');
