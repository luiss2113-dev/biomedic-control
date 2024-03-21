import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;

/*
# Run in debug mode
$ flutter run 

# Run in release mode
$ flutter run --release

https://developer.school/tutorials/how-to-use-environment-variables-with-flutter-dotenv
*/
class Enviroment {
  static String fileName =
      kReleaseMode ? ".env.production" : ".env.development";
  static String get apiUrl => dotenv.env['Base_Url'] ?? 'MY_FALLBACK';
  static String get host => Platform.isAndroid ? '127.0.0.1' : 'localhost';
  static Future<void> loadEnviroment(String file) async {
    await dotenv.load(fileName: "assets/env/$file");
  }
}
