import 'dart:io';

class Enviroments {
  static String apiURl = Platform.isAndroid
      ? 'http://10.0.2.2:3000/api'
      : 'http://localhost:3000/api';
  static String socketURL =
      Platform.isAndroid ? 'http://10.0.2.2:3000/api' : 'http://localhost:3000';
}
