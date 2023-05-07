import 'package:calorie_calculator/network/repository/login_repository.dart';
import 'package:calorie_calculator/view/home/home_screen.dart';
import 'package:calorie_calculator/view/register_view.dart';
import 'package:calorie_calculator/view/widgets/lottie_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  // içeriye controller atanıyor
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "FIT CALORİE",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 25,
            color: Colors.amber,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Kullanıcı Giriş",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  child: LottieBuilder.asset("assets/food_animation.json"),
                ),
                Form(
                    child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                            hintText: "Email Adresi",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            )),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.amber,
                            )),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      ValueListenableBuilder(
                          valueListenable: toggle,
                          builder: (context, value, child) {
                            return TextFormField(
                              controller: _passwordController,
                              obscureText: toggle.value,
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  suffix: InkWell(
                                      onTap: () {
                                        toggle.value = !toggle.value;
                                      },
                                      child: Icon(toggle.value
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility)),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  )),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.amber,
                                  )),
                            );
                          }),
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              shape: const StadiumBorder()),
                          onPressed: () async {
                            // iki textfield da boş değilse döndürecek

                            if (_emailController.text.isNotEmpty ||
                                _emailController.text.isNotEmpty) {
                              // login servis çağrılıyor
                              var service = await loginService(
                                  // email ve password içerisindeki dataları alıyorum
                                  _emailController.text,
                                  _passwordController.text);
                              if (service == 200) {
                                // ignore: use_build_context_synchronously
                                // snackbar ile uyarı çıkartıyorum
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Giriş Başarılı"),
                                  duration: Duration(milliseconds: 1100),
                                  backgroundColor: Colors.green,
                                ));

                                // home sayfasına yönlendirecek
                                //bekletme fonksiyonu
                                Future.delayed(const Duration(seconds: 1));
                                // navigasyon işlemi yapılacak
                                // sayfa home ekranına burdan yönlendir
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              } else if (service == 400) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Hatalı Giriş"),
                                  duration: Duration(milliseconds: 1100),
                                  backgroundColor: Colors.red,
                                ));
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Hatalı Giriş"),
                                  duration: Duration(milliseconds: 1100),
                                  backgroundColor: Colors.red,
                                ));
                              }
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                    "Hatalı İşlem: Lütfen bir değer girin"),
                                duration: Duration(milliseconds: 1100),
                                backgroundColor: Colors.red,
                              ));
                            }
                          },
                          child: const Text(
                            "Giriş Yap",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Register()));
                        },
                        child: const Text(
                          "Hesabın Yok mu ?  Kayıt ol",
                          style: TextStyle(
                            color: Colors.amber,
                          ),
                        ),
                      )
                    ],
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }

  ValueNotifier<bool> toogel = ValueNotifier<bool>(true);
}
