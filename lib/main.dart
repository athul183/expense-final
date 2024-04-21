import 'package:assessment_application_1/firebase_options.dart';
import 'package:assessment_application_1/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final firebaseauth = FirebaseAuth.instance;

void main() async {
  //await dotenv.load(fileName: "API_KEYS.env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final kDarkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 33, 103, 255),
    brightness: Brightness.dark,
  );

  final kLightColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 33, 103, 255),
    brightness: Brightness.light,
  );

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: const SplashScreen(),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: kDarkColorScheme,
          textTheme: GoogleFonts.latoTextTheme(),
        ),
        theme: ThemeData(
            colorScheme: ColorScheme.light(
                background: Colors.grey.shade100,
                onBackground: Colors.black,
                primary: const Color(0xFF00B2E7),
                secondary: const Color(0xFFE064F7),
                tertiary: const Color(0xFFFF8D6C),
                outline: Colors.grey)),
        debugShowCheckedModeBanner: false,
      );
}
