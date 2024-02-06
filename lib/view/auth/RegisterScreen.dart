import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saplinvest/services/auth_service.dart';
import 'package:saplinvest/view/auth/LoginScreen.dart';

import '../widgets/boxDecorationSplash.dart';
import '../widgets/myButton.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obsecure = true;
  String _email = "", _password = "", _passwordCheck = "", _nameSurname = "";
  final _formKey = GlobalKey<FormState>();
  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      if (_password == _passwordCheck) {
        await AuthService.signUp(
            name: _nameSurname, email: _email, password: _password);
      } else {
        Get.snackbar("Parola Hatası", "Girdiğiniz parolalar eşleşmiyor",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
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
                      hintText: "İsim Soyisim",
                      onSaved: (p0) {
                        _nameSurname = p0!;
                      },
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Lütfen isminizi giriniz';
                        }
                        return null;
                      }),
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
                      }),
                  myTextFormField(
                      obscureText: obsecure,
                      hintText: "Şifre",
                      onSaved: (password1) {
                        _password = password1 ?? "";
                      },
                      validator: (value) {
                        if (value == null || value.trim().length < 6) {
                          return 'Parola en az 6 haneli olmalı.';
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                          onPressed: () {
                            obsecure = !obsecure;
                            setState(() {});
                          },
                          icon: Icon(obsecure
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined))),
                  myTextFormField(
                      obscureText: obsecure,
                      hintText: "Şifre Tekrar",
                      validator: (value) {
                        if (value == null || value.trim().length < 6) {
                          return 'Parola en az 6 haneli olmalı.';
                        }
                        return null;
                      },
                      onSaved: (password2) {
                        _passwordCheck = password2 ?? "";
                      },
                      suffixIcon: IconButton(
                          onPressed: () {
                            obsecure = !obsecure;
                            setState(() {});
                          },
                          icon: Icon(obsecure
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined))),
                  myButton(onPressed: _submit, text: "Kayıt Ol"),
                  const SizedBox(
                    height: 20,
                  ),
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
                      const Text("Hesabınız Var Mı?"),
                      TextButton(
                          onPressed: () {
                            Get.off(const LoginScreen());
                          },
                          child: const Text("Giriş Yap"))
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
