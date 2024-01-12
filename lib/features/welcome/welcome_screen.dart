import 'package:culinary_app/features/authentication/login/login_screen.dart';
import 'package:culinary_app/features/authentication/registration/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Dahar'),
        centerTitle: true,
      ),
      body: Container( 
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterCarousel(
              options: CarouselOptions(
                showIndicator: true,
                slideIndicator: const CircularSlideIndicator(),
                autoPlay: true,
              ),
              items: [1,2,3,4].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/photo$i.png'),
                        ],
                      )
                    );
                  }
                );
              }).toList(),
            ),
            const Text('Morbi accumsan, leo sed hendrerit.', style: TextStyle(fontSize: 16.0)),
            Row(
              children: <Widget>[
                Expanded(
                  child: FilledButton(
                    onPressed: () => {Navigator.pushNamed(context, LoginScreen.id)}, 
                    child: const Text('Login')
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => {Navigator.pushNamed(context, RegistrationScreen.id)}, 
                    child: const Text('Register')
                  ),
                ),
              ]
            )
          ],
        ),
      ),
      )
    );
  }
}