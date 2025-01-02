import 'dart:async';
import 'package:aces/welcome_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget{
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {   //initState function is imp while working with Splash Screen concept
    super.initState();
    Timer(const Duration(seconds: 2), (){     // Splash screen will be there only for the specified time which is given
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  const WelcomePage()));    //splashReplacement is used to show only one time splash screen after 1 time presentation of splash screen it will automatically replaced
    });

  }
  // ignore: non_constant_identifier_names
  Widget ImageIcon1() {
    return Image.asset('assets/acesLogo.png', width: 300);
  }


  @override
  Widget build (BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;   //this is used to maximize the size of container to full scree.
    return Scaffold(
      body:Container(
        width: screenWidth,
        color: Colors.black,
        // color: const Color(0xffdf8e33),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            //title 1 welcome to
            const SizedBox( height: 00),
            ImageIcon1(),
            const SizedBox( height: 10),
          ],
        ),
      ),
    );
  }
}