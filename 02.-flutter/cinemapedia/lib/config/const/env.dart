import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String moviedbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'moviedb key doest exist';
  static String moviedbUrl = dotenv.env['THE_MOVIEDB_URL'] ?? 'moviedb url doest exist';
  static String moviedbLanguage = dotenv.env['THE_MOVIEDB_LANGUAGE'] ?? 'moviedb language doest exist';
}