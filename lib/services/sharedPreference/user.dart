import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> addUser(String? email) async {
    final SharedPreferences prefs = await _prefs;
    
    await prefs.setString("email", email!);
  }

  Future<int> getUserId() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getInt('id') ?? 0;
    });
  }

  Future<String> getEmail() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('email') ?? '';
    });
  }


}
