import 'package:flutter/material.dart';
import 'package:myportfolioflutter/colors/colors.dart';

class MainPageMobile extends StatefulWidget {
  const MainPageMobile({super.key});

  @override
  State<MainPageMobile> createState() => _MainPageMobileState();
}

class _MainPageMobileState extends State<MainPageMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainbk3,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/oops.png'),
              SizedBox(height: 20,),
              Text('You caught me there. I am working on mobile responsiveness.\nTill then use the desktop size.',
                style: TextStyle(color: Colors.white, fontFamily: 'Anta', fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
