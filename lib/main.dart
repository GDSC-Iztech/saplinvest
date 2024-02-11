import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:saplinvest/firebase_options.dart';
import 'package:saplinvest/view/HomeScreen.dart';
import 'package:saplinvest/view/auth/LoginScreen.dart';
import 'package:saplinvest/view/auth/RegisterScreen.dart';
import 'package:saplinvest/view/screens/SaplingPage.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: const TextTheme(
              bodySmall: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white),
              bodyLarge: TextStyle(color: Colors.black),
            ),
            useMaterial3: true,
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white))),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF17842F))))),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              // Future.delayed(
              //     const Duration(seconds: 2), FlutterNativeSplash.remove);
              if (snapshot.hasData) {
                FlutterNativeSplash.remove();
                return const SaplingPage();
              } else {
                FlutterNativeSplash.remove();

                return const LoginScreen();
              }
            }));
  }
}
