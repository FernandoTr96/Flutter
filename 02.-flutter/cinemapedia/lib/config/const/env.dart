import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String moviedbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'moviedb key doest exist';
}