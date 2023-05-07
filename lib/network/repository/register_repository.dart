import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<int> registerService(String email, String password) async {
  var prefs = await SharedPreferences.getInstance();
  try {
    final response = await Dio().post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyC4Iskr5TapBRKVQIHyMMktZrOyQZ0iWys',
        data: {
          'email': email,
          'password': password,
        });
    // shared preferences a kaydetme
    await prefs.setString('email', response.data['email']);
    // login sayfasında kullanım
    // await prefs.getString('email');
    return response.statusCode!;
  } catch (e) {
    return 400;
  }
}
