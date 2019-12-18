import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      home: WelcomeScreen(),

      /// Route isimleri "/welcome" vs.. gibi başında slash ile tanımlamlar yapılmış ise
      /// mutlaka boş bir home route belirten"/" yol kullanımlaıdır. Aksi durumda Global Key hatası alanabilir.
      initialRoute: WelcomeScreen.pageId,
      routes: {
        WelcomeScreen.pageId: (context) => WelcomeScreen(),
        LoginScreen.pageId: (context) => LoginScreen(),
        ChatScreen.pageId: (context) => ChatScreen(),
        RegistrationScreen.pageId: (context) => RegistrationScreen(),
      },
    );
  }
}
