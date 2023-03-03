import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'environment.dart';

class AppConfig{

  static Future<void> setUp() async {
    //Load environment file by compile mode
    await dotenv.load(fileName: Environment.getFileName);
  }
}