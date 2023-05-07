//http kütüphanesi
import 'package:dio/dio.dart';
// local satıra kaydetme kütüphaesi
import 'package:shared_preferences/shared_preferences.dart';

// future int bize integer döndüren değer anlamına gelir
// future amacı asenkron fonksiyonlarda kullanılır

Future<int> loginService(String email, String password) async {
  // shared preferences kütüphanesi datayı locale kaydetmek ve almak için kullanılır
  var prefs = await SharedPreferences.getInstance();
  try {
    // post işlemi yapılıyor
    final response = await Dio().post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyC4Iskr5TapBRKVQIHyMMktZrOyQZ0iWys',
        data: {
          'email': email,
          'password': password,
        });
    // shared preferences a kaydetme
    await prefs.setString('email', response.data['email']);
    // login sayfasında kullanım
    // await prefs.getString('email');
    // return olarak 200 döndürecek kısacak
    return response.statusCode!;
  } catch (e) {
    // kısaca hata var
    return 400;
  }
}
