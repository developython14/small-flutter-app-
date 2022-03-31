import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class toma extends StatelessWidget {
  const toma({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: IntroductionScreen(
      pages: [
        PageViewModel(
            title: "in small time",
            body: 'with strong quality',
            decoration: PageDecoration(),
            image: Image.asset('assets/start_app/0.jpg')),
        PageViewModel(
            title: "top experts",
            body: 'texperts and professor from difffrent fields and domains',
            decoration: PageDecoration(),
            image: Image.asset('assets/start_app/1.jpg')),
        PageViewModel(
            title: "best  client services",
            body: '24H/24 and 7days/7',
            decoration: PageDecoration(),
            image: Image.asset('assets/start_app/2.jpg')),
        PageViewModel(
            title: "low price with best quality",
            body: 'compotition ake the price very low',
            decoration: PageDecoration(),
            image: Image.asset('assets/start_app/3.jpg')),
        PageViewModel(
            title: "money return",
            body: 'if you are  not staisfaid we return your money',
            decoration: PageDecoration(),
            image: Image.asset('assets/start_app/4.jpg'))
      ],
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      skip: const Text("skip", style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Text("next", style: TextStyle(fontWeight: FontWeight.w600)),
      showSkipButton: true,
      showNextButton: true,
      onDone: () {
        // When done button is press
        Navigator.pushNamed(context, '/login');
      },
    ));
  }
}
