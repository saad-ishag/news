
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:know_news/presentation/screens/tabs_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToHomePage();
    super.initState();
  }

  void goToHomePage() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TabsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffBFC0C2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/news-logo.jpg',
              scale: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: AnimatedTextKit(
                  pause: const Duration(milliseconds: 900),
                  totalRepeatCount: 3,
                  animatedTexts: [
                    ColorizeAnimatedText('News',
                        textStyle: const TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                        colors: [Colors.black45, Colors.white54]),
                  ]),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
