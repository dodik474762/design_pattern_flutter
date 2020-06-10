
//untuk setting session [sharedpreference] shared_preferences: ^0.5.7+3
import 'package:shared_preferences/shared_preferences.dart';

class Session{
 //set params all session
 static String counter = 'counter';
 static String operate = 'operate';
 static Future<SharedPreferences> sharepref = SharedPreferences.getInstance();

 //set params all session
 static Function push = (String param, String value) async{
   SharedPreferences _prefs =  await sharepref;
   _prefs.setString(param, value);
 };

 static Future<String> pull (String param)async{
   SharedPreferences _pref = await sharepref;
   return _pref.getString(param);
 }

 static Function remove = (String param) async{
   SharedPreferences _prefs =  await sharepref;
   _prefs.remove(param);
 };
}