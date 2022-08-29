// dah nfs l dio helper


import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
 static late SharedPreferences sharedPreferences;


 static init() async
 {
  return  sharedPreferences = await SharedPreferences.getInstance();
 }

static Future<bool> putBoolean ({
 required String key,
 required bool value,
})async
 {
  return await sharedPreferences.setBool(key, value);
 }


static dynamic getData ({
  required String key,
 })
 {
   return sharedPreferences.get(key);
 }

 static Future<bool> saveData ({
  required String key,
  required dynamic value,
})async
{
 // l data lw gyale string htro7 lele odmaha we hakaza fel int we bool

 if (value is String) return await sharedPreferences.setString(key, value);
 if (value is int) return await sharedPreferences.setInt(key, value);
 if (value is bool) return await sharedPreferences.setBool(key, value);

 // lw 7aga 8er keda htro7ll double
 return await sharedPreferences.setDouble(key, value);
}

 static Future<bool> removeData ({
 required String key,
})async
{
return await sharedPreferences.remove(key);
}


 static setFavLocation({String? key, String? value}) async {
  return await sharedPreferences.setString(key!, value!);
 }

 static getFavLocation({String? key}) {
  return sharedPreferences.getString(key!);
 }

}