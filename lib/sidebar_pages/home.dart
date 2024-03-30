import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myportfolioflutter/colors/colors.dart';
import 'package:myportfolioflutter/widgets/home_socials_container.dart';
import 'package:myportfolioflutter/widgets/home_stats_container.dart';
import 'package:url_launcher/url_launcher.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  final String receiverEmailAddress = 'ronit52dev@gmail.com';

  Future<void> _openComposeMailPage() async {
    final Uri composeMailUri = Uri(
      scheme: 'https',
      host: 'mail.google.com',
      path: '/mail/u/0/#inbox?compose=new',
      queryParameters: {'to': receiverEmailAddress},
    );

    if (await canLaunch(composeMailUri.toString())) {
      await launch(composeMailUri.toString());
    } else {
      throw 'Could not open compose mail page';
    }
  }

  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    bool fullScreen = width > 1815;
    bool windowed = width <= 1815 && width > 1300;

    bool stats = width < 1420;

    return Scaffold(
      backgroundColor: AppColors.mainbk3,
      body: DottedBackgroundContainer(
        child: SingleChildScrollView(
        child: Column(
        children: [
          Text('${height}', style: TextStyle(color: Colors.white),),
          Text('${width}', style: TextStyle(color: Colors.white),),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(500),
                  bottomRight: Radius.circular(500),
                  bottomLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                color: Colors.blueGrey,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.deepPurple,
                    Colors.blue,
                    Colors.indigo
                  ], // Add your gradient colors here
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: MouseRegion(
                          onEnter: (_){
                            setState(() {
                              isHovered = true;
                            });
                          },

                          onExit: (_){
                            setState(() {
                              isHovered = false;
                            });
                          },

                          cursor: SystemMouseCursors.click,

                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.yellow,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  isHovered ? 'Welcome to my portfolio' : "Hey, I'm Ronit!",
                                  style: TextStyle(fontSize: fullScreen ?50 : windowed ? 35 : 25, fontFamily: 'Protest', fontWeight: FontWeight.bold, letterSpacing: 5),),
                              )),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "A software engineer with",
                    style: TextStyle(fontSize: fullScreen ? 35 : windowed ? 25 : 20, fontFamily: 'Anta', color: Colors.white),
                  ),
                  Container(
                    // decoration: BoxDecoration(
                    //   color: Colors.green[200],
                    //   borderRadius: BorderRadius.circular(16)
                    // ),
                    // width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            "Knowledge about Mobile Development using Native Android and Flutter, and Web Development with React.",
                            style: TextStyle(fontSize: fullScreen ? 17 : windowed ? 13 : 10, fontFamily: 'Urbanist', fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 2),
                          ),
                          Text(
                            "I like to build software from scratch and bring values into people's life.",
                            style: TextStyle(fontSize: fullScreen ? 17 : windowed ? 13 : 10, fontFamily: 'Urbanist', fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 2),
                          ),
                          Text(
                            "Excited to learn and work on new technologies and taste all cool techs.",
                            style: TextStyle(fontSize: fullScreen ? 17 : windowed ? 13 : 10, fontFamily: 'Urbanist', fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Lottie.asset('assets/anims/coding.json', height: fullScreen ? 500 : windowed ? 300 : 200),

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: Container(
                      padding: EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.deepPurple,
                              Colors.blue,
                              Colors.indigo
                            ]
                        )
                      ),
                      child: !stats ? Wrap(
                        children: [

                          HomeStatsContainer(
                            message: "I have solved more than 400 DSA questions on coding platforms like Leetcode and GeeksForGeeks",
                            number: '400+',
                            description: 'DSA questions',
                          ),

                          SizedBox(width: 20,),

                          HomeStatsContainer(
                            message: "I started my development journey with Android and have actually completed many projects in it",
                            number: '10+',
                            description: 'Android Projects',
                          ),

                          SizedBox(width: 20,),

                          HomeStatsContainer(
                            message: "I have made various flutter applications for Android, iOS and Websites",
                            number: '5+',
                            description: 'Flutter Projects',
                          ),

                          SizedBox(width: 20,),

                          HomeStatsContainer(
                            message: "I currently have received 9.23 CGPA out of 10, which corresponds to my excellence in academics",
                            number: '9.23',
                            description: 'CGPA',
                          ),

                        ],
                      )
                          :

                      Column(
                        children: [

                          Row(
                            children: [
                              HomeStatsContainer(
                                message: "I have solved more than 400 DSA questions on coding platforms like Leetcode and GeeksForGeeks",
                                number: '400+',
                                description: 'DSA questions',
                              ),

                              SizedBox(width: 20,),

                              HomeStatsContainer(
                                message: "I started my development journey with Android and have actually completed many projects in it",
                                number: '10+',
                                description: 'Android Projects',
                              ),
                            ],
                          ),




                          SizedBox(height: 20,),

                          Row(
                            children: [
                              HomeStatsContainer(
                                message: "I have made various flutter applications for Android, iOS and Websites",
                                number: '5+',
                                description: 'Flutter Projects',
                              ),

                              SizedBox(width: 20,),

                              HomeStatsContainer(
                                message: "I currently have received 9.23 CGPA out of 10, which corresponds to my excellence in academics",
                                number: '9.23',
                                description: 'CGPA',
                              ),
                            ],
                          ),




                        ],
                      ) ,
                    ),
                  ),

                  Image.asset('assets/images/icon_dotted.png', height: 100, color: Colors.indigo),
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: Container(

                      padding: EdgeInsets.all(40),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.blueGrey),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.deepPurple,
                                Colors.blue,
                                Colors.indigo
                              ]
                          )
                      ),
                      child: !stats ? Wrap(
                        children: [

                          HomeSocialContainer(url: 'https://www.linkedin.com/in/ronitsavadimath', message: 'LinkedIn', imagePath: 'assets/images/icon_linkedin.png'),

                          SizedBox(width: 30,),

                          HomeSocialContainer(url: 'https://github.com/RonitRs5', message: 'Github', imagePath: 'assets/images/icon_github.png'),

                          SizedBox(width: 30,),

                          HomeSocialContainer(url: 'https://discord.gg/zwzNgNqM', message: 'Discord', imagePath: 'assets/images/icon_discord.png'),

                          SizedBox(width: 30,),

                          HomeSocialContainer(url: 'https://www.instagram.com/ronitsavadimath_5/', message: 'Instagram', imagePath: 'assets/images/icon_instagram.png'),

                          SizedBox(width: 30,),

                          GestureDetector(
                      onTap: _openComposeMailPage,

                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Tooltip(
                            message: 'Gmail',
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/icon_email.png',
                                height:  fullScreen ? 60 : windowed ? 40 : 25 ,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                        ],
                      )
                          :

                      Column(
                        children: [

                          Row(
                            children: [
                              HomeSocialContainer(url: 'https://www.linkedin.com/in/ronitsavadimath', message: 'LinkedIn', imagePath: 'assets/images/icon_linkedin.png'),

                              SizedBox(width: 30,),

                              HomeSocialContainer(url: 'https://github.com/RonitRs5', message: 'Github', imagePath: 'assets/images/icon_github.png'),
                            ],
                          ),

                          SizedBox(height: 30,),

                          Row(
                            children: [
                              HomeSocialContainer(url: 'https://github.com/RonitRs5', message: 'Github', imagePath: 'assets/images/icon_github.png'),

                              SizedBox(width: 30,),

                              HomeSocialContainer(url: 'https://discord.gg/zwzNgNqM', message: 'Discord', imagePath: 'assets/images/icon_discord.png'),
                            ],
                          ),

                          SizedBox(height: 30,),

                          Row(
                            children: [
                              HomeSocialContainer(url: 'https://discord.gg/zwzNgNqM', message: 'Discord', imagePath: 'assets/images/icon_discord.png'),

                              SizedBox(width: 30,),

                              HomeSocialContainer(url: 'https://www.instagram.com/ronitsavadimath_5/', message: 'Instagram', imagePath: 'assets/images/icon_instagram.png'),
                            ],
                          ),

                          SizedBox(height: 30,),


                          
                          GestureDetector(
                            onTap: _openComposeMailPage,

                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Tooltip(
                                  message: 'Gmail',
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Image.asset(
                                      'assets/images/icon_email.png',
                                      height:  fullScreen ? 60 : windowed ? 40 : 25 ,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Lottie.asset('assets/anims/coding2.json', height: fullScreen ? 500 : windowed ? 300 : 200),
            ],
          ),
        ],
          ),
          ),
      ),
    );
  }

}
class DottedBackgroundContainer extends StatelessWidget {
  final Widget child;

  DottedBackgroundContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: CustomPaint(
        painter: DottedBackgroundPainter(colors: [Colors.white]),
        child: child,
      ),
    );
  }
}


class DottedBackgroundPainter extends CustomPainter {
  final List<Color> colors;

  DottedBackgroundPainter({required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = 0.1
      ..style = PaintingStyle.fill;

    final double dotSpacing = 150.0;
    final double radius = 2.0;

    final Random random = Random();

    for (double i = 0; i < size.width; i += dotSpacing) {
      for (double j = 0; j < size.height; j += dotSpacing) {
        paint.color = colors[random.nextInt(colors.length)];
        canvas.drawCircle(Offset(i, j), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}