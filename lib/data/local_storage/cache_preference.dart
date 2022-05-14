import 'package:know_news/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheProvider{

   static late SharedPreferences _preferences ;

  static Future init()async{
    _preferences = await SharedPreferences.getInstance();
  }
  static Future setTheme(bool dark)async{
    await _preferences.setBool(kThemeKey, dark);
  }
  static getTheme(){
    return _preferences.getBool(kThemeKey);
  }
}
// i could do this functionality with the Hydrated bloc