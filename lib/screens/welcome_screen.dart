import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded-button.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String pageId = "welcome_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

//AnimationController 3 parçadan meydana gelir: 1- Controller 2- Ticker 3- Value 4- Animasyon
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller; // 1- Controller
  Animation animation; // 4- Animasyon
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this, // 2-Ticker

      // Animation Curve 0-1 arasında işlediği için upper bounda max 1 olmalıdır!
      //upperBound: 100,
    );

    controller.forward(); // 3- İleri sar...

    /// Curved animation -- Giriş Çıkış Efektleri için kullanılır.
//    animation = CurvedAnimation(
//      curve: Curves.easeIn,
//      parent: controller,
//    );
//
    ///İleri Geri Loop Yapmak için controllerın statusu kontrol edilir. Çıkan sonuca göre hareket edilir.
//    animation.addStatusListener((status) {
//      print(status);
//      if (status == AnimationStatus.completed)
//        controller.reverse(from: 100);
//      else if (status == AnimationStatus.dismissed) controller.forward();
//    });

    /// ColorTween Animation
    animation =
        ColorTween(begin: Colors.blue, end: Colors.white).animate(controller);

    /// BorderRadiusTween
//    animation = BorderRadiusTween(
//            begin: BorderRadius.circular(5), end: BorderRadius.circular(100))
//        .animate(controller);

    controller.addListener(() {
      setState(() {});
      //print(controller.value);
      print(animation.value);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value, //Colors.white,
      // Color.pink.withOpacity(controller.value), //  "animation.value, ColorTween"
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height:
                        controller.value * 60, //60.0,  // animation.value * 60,
                  ),
                ),
                TypewriterAnimatedTextKit(
                    text: ["Flash Chat"],
                    textStyle: TextStyle(
                      fontSize: 45.0, //controller.value - 50,
                      fontWeight: FontWeight.w900,
                    )),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: "Log In",
              color: kBlue,
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.pageId);
              },
            ),
            RoundedButton(
              title: "Regiter",
              color: kIndigo,
              onTap: () {
                Navigator.pushNamed(context, RegistrationScreen.pageId);
              },
            )
          ],
        ),
      ),
    );
  }
}
