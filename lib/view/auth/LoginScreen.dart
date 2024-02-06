import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saplinvest/view/auth/RegisterScreen.dart';

import '../../services/auth_service.dart';
import '../widgets/boxDecorationSplash.dart';
import '../widgets/myButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = "", _password = "";
  bool _obsecure = true;
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: greenBackground,
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logo.jpg",
                    height: 200,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  myTextFormField(
                    hintText: "Email",
                    onSaved: (email) {
                      _email = email ?? "";
                    },
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty ||
                          !value.contains("@")) {
                        return 'Lütfen geçerli bir email giriniz.';
                      }
                      return null;
                    },
                  ),
                  myTextFormField(
                      validator: (value) {
                        if (value == null || value.trim().length < 6) {
                          return 'Parola en az 6 haneli olmalı.';
                        }
                        return null;
                      },
                      hintText: "Şifre",
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obsecure = !_obsecure;
                            });
                          },
                          icon: Icon(Icons.remove_red_eye_outlined)),
                      obscureText: _obsecure,
                      onSaved: (password) {
                        _password = password ?? "";
                      }),
                  myButton(
                      onPressed: () async {
                        _submit();
                        await AuthService.signIn(
                            email: _email, password: _password);
                      },
                      text: "Giriş Yap"),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Şifremi Unuttum",
                          ))),
                  const Text("Ya Da"),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.g_mobiledata,
                        size: 40,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Hesabınız Yok Mu?"),
                      TextButton(
                          onPressed: () {
                            Get.off(RegisterScreen());
                          },
                          child: const Text("Kayıt Ol"))
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}

Widget myTextFormField({
  String hintText = "",
  Widget? suffixIcon,
  bool obscureText = false,
  String? Function(String?)? validator,
  void Function(String?)? onSaved,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    child: TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        suffixIcon: suffixIcon,
        border: InputBorder.none,
      ),
      validator: validator,
      onSaved: onSaved,
    ),
  );
}
