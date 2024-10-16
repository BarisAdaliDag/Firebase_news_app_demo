import 'package:shared_preferences/shared_preferences.dart';

//5 vid 44dk
class AppCache {
  AppCache._();

  static AppCache instance = AppCache._();

  Future<void> setup() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  late SharedPreferences sharedPreferences;
}
