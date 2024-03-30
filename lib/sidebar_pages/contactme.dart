import 'package:flutter/material.dart';
import 'package:myportfolioflutter/colors/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMe extends StatefulWidget {
  const ContactMe({super.key});

  @override
  State<ContactMe> createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainbk3,
      body: DottedBackgroundContainer(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.mainbk2
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Message me',
                    style: TextStyle(
                        fontFamily: 'Anta', color: Colors.white, fontSize: 26),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: 520,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      maxLines: null,
                      maxLength: null,
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white, fontFamily: 'Anta'),
                      decoration: const InputDecoration(
                        labelText: 'Enter your email',
                        labelStyle:
                            TextStyle(fontFamily: 'Anta', color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                      // Add any additional properties or methods you need for your input field
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: 520,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      maxLines: null,
                      maxLength: 240,
                      cursorColor: Colors.white,

                      style: const TextStyle(color: Colors.white, fontFamily: 'Anta'),
                      decoration: const InputDecoration(
                        labelText: 'Write a message',
                        labelStyle:
                            TextStyle(fontFamily: 'Anta', color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                      // Add any additional properties or methods you need for your input field
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: 520,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.mainbk4),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Unable to connect with the server"),
                                content: Text("Please use other approaches for contacting me"),

                              );
                            },
                          );
                        },
                        child: const Text(
                          'Send',
                          style:
                              TextStyle(fontFamily: 'Anta', color: Colors.white),
                        )),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const SizedBox(
                    width: 520,
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColors.mainbk1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'OR',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: AppColors.mainbk1,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 32,
                  ),

                  Text(
                    'Connect me',
                    style: TextStyle(
                        fontFamily: 'Anta', color: Colors.white, fontSize: 26),
                  ),

                  const SizedBox(
                    height: 16,
                  ),

                  Wrap(
                    children: [
                      GestureDetector(
                        onTap: (){
                          _launchURL('https://www.linkedin.com/in/ronitsavadimath');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.mainbk1,
                            border: Border.all(
                              color: AppColors.mainbk4,
                              width: 1
                            )
                          ),
                          child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Tooltip(
                                  message: 'LinkedIn',
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Image.asset(
                                      'assets/images/icon_linkedin.png',
                                      height: 40,
                                    ),
                                  ))),
                        ),
                      ),

                      SizedBox(width: 8,),

                      GestureDetector(
                        onTap: (){
                          _launchURL('https://github.com/RonitRs5');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.mainbk1,
                              border: Border.all(
                                  color: AppColors.mainbk4,
                                  width: 1
                              )
                          ),
                          child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Tooltip(
                                  message: 'Github',
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Image.asset(
                                      'assets/images/icon_github.png',
                                      height: 40,
                                    ),
                                  ))),
                        ),
                      ),

                      SizedBox(width: 8,),

                      GestureDetector(
                        onTap: (){
                          _launchURL('https://discord.gg/zwzNgNqM');
                        },

                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.mainbk1,
                              border: Border.all(
                                  color: AppColors.mainbk4,
                                  width: 1
                              )
                          ),
                          child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Tooltip(
                                  message: 'Discord',
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Image.asset(
                                      'assets/images/icon_discord.png',
                                      height: 40,
                                    ),
                                  ))),
                        ),
                      ),

                      SizedBox(width: 8,),

                      GestureDetector(
                        onTap: (){
                          _launchURL('https://www.instagram.com/ronitsavadimath_5/');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.mainbk1,
                              border: Border.all(
                                  color: AppColors.mainbk4,
                                  width: 1
                              )
                          ),
                          child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Tooltip(
                                  message: 'Instagram',
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Image.asset(
                                      'assets/images/icon_instagram.png',
                                      height: 40,
                                    ),
                                  ))),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
    

    for (double i = 0; i < size.width; i += dotSpacing) {
      for (double j = 0; j < size.height; j += dotSpacing) {
        paint.color = Colors.white;
        canvas.drawCircle(Offset(i, j), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
