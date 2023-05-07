import 'package:calorie_calculator/network/repository/register_repository.dart';
import 'package:calorie_calculator/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "FIT CALORİE",
          style: TextStyle(
              fontWeight: FontWeight.w800, fontSize: 25, color: Colors.amber),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Kayıt Ol",
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
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                              hintText: "Adınız Soyadınız",
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              )),
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.amber,
                              )),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              hintText: "Email Adrsi",
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              )),
                              prefixIcon: const Icon(
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
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.amber,
                                shape: const StadiumBorder()),
                            onPressed: () async {
                              if (_emailController.text.isNotEmpty ||
                                  _emailController.text.isNotEmpty) {
                                var service = await registerService(
                                    _emailController.text,
                                    _passwordController.text);
                                if (service == 200) {
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("Kayıt Başarılı"),
                                    duration: Duration(milliseconds: 1500),
                                    backgroundColor: Colors.green,
                                  ));

                                  // home sayfasına yönlendirecek
                                  Future.delayed(const Duration(seconds: 1));
                                  // navigasyon işlemi yapılacak
                                  // sayfa home ekranına burdan yönlendirilecek
                                } else if (service == 400) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("Hatalı Kayıt"),
                                    duration: Duration(milliseconds: 1500),
                                    backgroundColor: Colors.red,
                                  ));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("Kayıt Hatalı"),
                                    duration: Duration(milliseconds: 1500),
                                    backgroundColor: Colors.red,
                                  ));
                                }
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text(
                                      "Kayıt Hatalı: Lütfen Boş değer girmeyin"),
                                  duration: Duration(milliseconds: 1500),
                                  backgroundColor: Colors.red,
                                ));
                              }
                            },
                            child: const Text(
                              "Kayıt Ol",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: const Text(
                            "Bir hesabın mı var ? Giriş Yap.",
                            style: TextStyle(
                              color: Colors.amber,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
