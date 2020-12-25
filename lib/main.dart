import 'package:chatapp/auth/user_authentication.dart';
import 'package:chatapp/screens/chat_screen.dart';
import 'package:chatapp/screens/login_screen.dart';
import 'package:chatapp/screens/registration_screen.dart';
import 'package:chatapp/screens/welcome_screen.dart';
import 'package:chatapp/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark().copyWith(
      //   textTheme: TextTheme(
      //     bodyText2: TextStyle(
      //       color: Colors.black54,
      //     ),
      //   ),
      // ),
      initialRoute:
          UserAuthentication().isUserLoggedIn() ? kChatRoute : kWelcomeRoute,
      routes: {
        kLoginRoute: (context) => LoginScreen(),
        kRegistrationRoute: (context) => RegistrationScreen(),
        kWelcomeRoute: (context) => WelcomeScreen(),
        kChatRoute: (context) => ChatScreen(),
      },
    );
  }
}
