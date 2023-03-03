import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment{
  static String get getFileName{
    if(kReleaseMode){
      return '.env.prod';
    }
    else{
      return '.env.dev';
    }
  }
  static String get apiUrl{
    return dotenv.env['API_URL'] ?? 'API_URL not found!';
  }
}