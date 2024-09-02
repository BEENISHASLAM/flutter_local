import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeLanguageController with ChangeNotifier{

  Locale? _appLocale;
  Locale? get appLocale => _appLocale;
void changeLanguage(Locale type) async{
  SharedPreferences sp = await SharedPreferences.getInstance();
  _appLocale = type;
  if( type == Locale("en") ){
    sp.setString("language_code", "en");

  }else if(type == Locale("ur")){
    sp.setString("language_code", "ur");
  }
  else{
    sp.setString("language_code", "es");
  }
  notifyListeners();


}
}
