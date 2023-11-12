import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> addUser(int? id, String? nama, String? noTelp) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setInt("id", id!);
    await prefs.setString("nama", nama!);
    await prefs.setString("noTelp", noTelp!);
  }

  Future<int> getUserId() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getInt('id') ?? 0;
    });
  }

  Future<String> getNama() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('nama') ?? '';
    });
  }

  Future<String> getNoTelp() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('noTelp') ?? '';
    });
  }
}
