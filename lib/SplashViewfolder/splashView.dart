// ignore_for_file: file_names, avoid_unnecessary_containers


import 'package:flutter/material.dart';
import 'package:weatherappv2/pages/Homepagefolder/homepage.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => SplashViewbase();
}

class SplashViewbase extends State<SplashView>
    with SingleTickerProviderStateMixin {
  //? to use for Nullable or not (Null check operator)
  //if it null you have to make !(not)  to ensure (تاكد) its not null value
  AnimationController? animationController;
  Animation<double>? fadinganimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this, // for SingleTickerProviderStateMixin or more
      duration: const Duration(milliseconds: 600), //when it will closed ?
    );
    fadinganimation =
        //when it will start and end Animation
        Tween<double>(begin: .2, end: 1).animate(animationController!);

    // //if we do ! then the code do not get throw exseption it will lage only (هيعلق)
    // animationController?.forward();
    animationController?.repeat(reverse: true);
    goToNextView();
  }

  @override
  void dispose() {
    super.dispose();
    animationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Spacer(),
        const Spacer(),
        SafeArea(
          child: FadeTransition(
            opacity: fadinganimation!,
            child: const Text(
              'Weather APP',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 51,
                color: Color(0xffffffff),
              ),
            ),
          ),
        ),
        const Spacer(),
        Image.asset('assets/img/cloudy.png'),
      ]),
    );   
  }

  void goToNextView() {
  Future.delayed(const Duration(seconds: 3), () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const Homepage();
        },
      ),
    );
  });
}
}

