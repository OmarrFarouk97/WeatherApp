import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/componat.dart';
import '../../../home/presentation/pages/home_screen.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
     navigateTo(context, HomeScreen());
      //Navigator.pushReplacementNamed(context, '/weather_page');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Image.asset(
              'assets/images/1.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Container(
              width: double.infinity,
              padding:  EdgeInsets.symmetric(horizontal:16 ,vertical: 10  ),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image(
                      image: AssetImage('assets/images/cloudy.png'),
                      height: 250,width: 250,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Text(
                    'Discover the Weather ',
                    style: const TextStyle(
                      fontSize: 24.0,color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'in Your City',
                    style: const TextStyle(
                      fontSize: 24.0,color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    'Get to Know your weather maps and  ',
                    style: const TextStyle(
                        fontSize: 14.0,color: Colors.white54,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'radar precipitation forecast',
                    style: const TextStyle(
                        fontSize: 14.0,color: Colors.white54,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 30.0),
                ],
              ),

          ),
        ],
      ),
    );
  }
}
