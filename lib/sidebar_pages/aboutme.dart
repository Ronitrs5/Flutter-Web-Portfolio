import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myportfolioflutter/colors/colors.dart';
import 'package:myportfolioflutter/widgets/education_container.dart';
import 'package:myportfolioflutter/widgets/languages.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    bool fullScreen = width > 1815;
    bool windowed = width <= 1815 && width > 1300;

    bool skillsWindow = 1470 < width;

    bool showR = 1090 > width;

    return Scaffold(
      backgroundColor: AppColors.mainbk3,
      body: DottedBackgroundContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 50, 0, 0),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.black
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "About me",
                            style: TextStyle(fontSize: fullScreen ? 30 : windowed ? 22 : 20, fontFamily: 'Protest', fontWeight: FontWeight.bold, letterSpacing: 5, color: Colors.white70),
                          ),
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Visibility(
                    visible: !showR,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            onEnter: (_) {
                              setState(() {
                                isHovered = true;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                isHovered = false;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: isHovered
                                      ? [Colors.red, Colors.orange, Colors.yellow]
                                      :
                                      [AppColors.mainbk4, AppColors.mainbk2, AppColors.mainbk1, AppColors.mainbk3]

                                      // : [Colors.deepPurple, Colors.blue, Colors.indigo],
                                ),
                              ),
                              child: Transform.scale(
                                scale: isHovered ? 1.05 : 1.0, // Scale factor when hovered
                                child: Image.asset(
                                  'assets/images/icon_rr.png',
                                  color: isHovered ? null : Colors.white70,
                                  width: fullScreen ? 400 : windowed ? 300 : 200,
                                  height: fullScreen ? 400 : windowed ? 300 : 200
                                )
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: fullScreen ? null : windowed? 600 : 500,
                      child: Column(
                        children: [
                          Text("Hey, I'm", style: TextStyle(fontFamily: 'Urbanist', color: AppColors.normalText, fontSize: 20),),

                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.mainbk1
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("RONIT SAVADIMATH",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Protest',
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),

                          Text("and a software engineer who is passionate about technology.", style: TextStyle(fontFamily: 'Urbanist',  color: AppColors.normalText, fontSize: 20)),
                          Text("Loves to build software from scratch and bring value into people's life.", style: TextStyle(fontFamily: 'Urbanist',  color: AppColors.normalText, fontSize: 20)),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                            child: Image.asset('assets/images/icon_dotted.png', height: 100,color: Colors.grey,),
                          ),


                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text("I have a good understanding about", style: TextStyle(fontFamily: 'Urbanist',  color: AppColors.normalText, fontSize: 20)),

                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.mainbk1
                                        // color: Colors.lightGreenAccent
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Mobile and Web Development",
                                        style: TextStyle(
                                            fontSize: 30,
                                          fontFamily: 'Protest',
                                          color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ),

                                  Text("but I am always open and interested to learn a new technology which is relevant in the industry.",
                                      style: TextStyle(fontFamily: 'Urbanist', color: AppColors.normalText, fontSize: 20)),

                                ],
                              )

                          ),
                        ],
                      ),
                    ),
                  ),

                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                          child: Image.asset('assets/images/resume_image.jpg', width: 700,),
                                          onTap: (){
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text('This is a JPEG image and does not support text copying. Download the resume to get the PDF format.'),
                                                  backgroundColor: Colors.red,
                                                  behavior: SnackBarBehavior.floating,),
                                            );
                                            Navigator.pop(context);
                                          },
                                        ),
                                        SizedBox(height: 20),
                                        // RaisedButton(
                                        //   onPressed: () {
                                        //     Navigator.pop(context); // Close the dialog
                                        //   },
                                        //   child: Text('Close'),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Tooltip(
                            message: 'View resume',
                            textStyle: TextStyle(
                                fontFamily: 'Anta',
                                color: Colors.white
                            ),
                            decoration: BoxDecoration(
                                color: Colors.black
                            ),
                            child: Container(
                              padding: EdgeInsets.all(50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: AppColors.mainbk1
                              ),
                                child: Image.asset('assets/images/icon_resume.png',
                                    width: fullScreen ? 250 : windowed ? 180 : 140,
                                    height: fullScreen ? 250 : windowed ? 180 : 140
                                )
                            ),
                          ),
                        ),
                      ),
                    ],
                  )

                ],
              ),

              SizedBox(height: 50,),

              Divider(thickness: 1, color: Colors.indigo,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 50, 0, 20),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.black,
                          // color: Colors.yellow,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Skills",
                            style: TextStyle(fontSize:30, fontFamily: 'Protest', fontWeight: FontWeight.bold, letterSpacing: 5, color: Colors.white70),
                          ),
                        )),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: skillsWindow ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                          color: AppColors.mainbk1,
                      ),
                      child: Column(
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('Programming Languages', style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Anta')),
                          ),
                          Row(
                            children: [
                              LanguageWidget(imagePath: 'assets/images/icon_c.png', labelText: 'C++'),
                              LanguageWidget(imagePath: 'assets/images/icon_java.png', labelText: 'Java'),
                              LanguageWidget(imagePath: 'assets/images/icon_dart.webp', labelText: 'Dart'),
                            ],
                          ),

                          Row(
                            children: [
                              LanguageWidget(imagePath: 'assets/images/icon_python.png', labelText: 'Python'),
                              LanguageWidget(imagePath: 'assets/images/icon_js.png', labelText: 'Javascript'),
                              LanguageWidget(imagePath: 'assets/images/icon_kotlin.png', labelText: 'Kotlin'),
                            ],
                          ),


                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        color: AppColors.mainbk1,
                      ),
                      child: Column(
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('Frameworks and Technologies', style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Anta'),),
                          ),
                          Row(
                            children: [
                              LanguageWidget(imagePath: 'assets/images/icon_android.png', labelText: 'Android'),
                              LanguageWidget(imagePath: 'assets/images/icon_flutter.png', labelText: 'Flutter'),
                              LanguageWidget(imagePath: 'assets/images/icon_react.png', labelText: 'React.js'),
                            ],
                          ),

                          Row(
                            children: [
                              LanguageWidget(imagePath: 'assets/images/icon_html.png', labelText: 'HTML'),
                              LanguageWidget(imagePath: 'assets/images/icon_css.png', labelText: 'CSS'),
                            ],
                          ),

                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        color: AppColors.mainbk1,                    ),
                      child: Column(
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('Technical Skills', style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Anta'),),
                          ),
                          Row(
                            children: [
                              LanguageWidget(imagePath: 'assets/images/icon_androidstudio.png', labelText: 'Android Studio'),
                              LanguageWidget(imagePath: 'assets/images/icon_dsa.png', labelText: 'DSA'),
                              LanguageWidget(imagePath: 'assets/images/icon_oops.png', labelText: 'OOP'),
                            ],
                          ),

                          Row(
                            children: [
                              LanguageWidget(imagePath: 'assets/images/icon_cloud.png', labelText: 'Cloud Computing'),
                              LanguageWidget(imagePath: 'assets/images/icon_ml.png', labelText: 'ML'),
                              LanguageWidget(imagePath: 'assets/images/icon_os.png', labelText: 'OS'),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                )
                    :

                Column(
                  children: [

                    Container(
                      padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.mainbk1,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center ,
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('Programming Languages', style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Anta')),
                          ),
                          Wrap(
                            children: [
                              LanguageWidget(imagePath: 'assets/images/icon_c.png', labelText: 'C++'),
                              LanguageWidget(imagePath: 'assets/images/icon_java.png', labelText: 'Java'),
                              LanguageWidget(imagePath: 'assets/images/icon_dart.webp', labelText: 'Dart'),
                            ],
                          ),

                          Wrap(
                            children: [
                              LanguageWidget(imagePath: 'assets/images/icon_python.png', labelText: 'Python'),
                              LanguageWidget(imagePath: 'assets/images/icon_js.png', labelText: 'Javascript'),
                              LanguageWidget(imagePath: 'assets/images/icon_kotlin.png', labelText: 'Kotlin'),
                            ],
                          ),


                        ],
                      ),
                    ),

                    SizedBox(height: 20,),

                    Container(
                      padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.mainbk1,
                      ),
                      child: Column(
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('Frameworks and Technologies', style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Anta'),),
                          ),
                          Wrap(
                            children: [
                              LanguageWidget(imagePath: 'assets/images/icon_android.png', labelText: 'Android'),
                              LanguageWidget(imagePath: 'assets/images/icon_flutter.png', labelText: 'Flutter'),
                              LanguageWidget(imagePath: 'assets/images/icon_react.png', labelText: 'React.js'),
                            ],
                          ),

                          Wrap(
                            children: [
                              LanguageWidget(imagePath: 'assets/images/icon_html.png', labelText: 'HTML'),
                              LanguageWidget(imagePath: 'assets/images/icon_css.png', labelText: 'CSS'),
                            ],
                          ),

                        ],
                      ),
                    ),

                    SizedBox(height: 20,),

                    Container(
                      padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.mainbk1,                    ),
                      child: Column(
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('Technical Skills', style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Anta'),),
                          ),
                          Wrap(
                            children: [
                              LanguageWidget(imagePath: 'assets/images/icon_androidstudio.png', labelText: 'Android Studio'),
                              LanguageWidget(imagePath: 'assets/images/icon_dsa.png', labelText: 'DSA'),
                              LanguageWidget(imagePath: 'assets/images/icon_oops.png', labelText: 'OOP'),
                            ],
                          ),

                          Wrap(
                            children: [
                              LanguageWidget(imagePath: 'assets/images/icon_cloud.png', labelText: 'Cloud Computing'),
                              LanguageWidget(imagePath: 'assets/images/icon_ml.png', labelText: 'ML'),
                              LanguageWidget(imagePath: 'assets/images/icon_os.png', labelText: 'OS'),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50,),

              Divider(thickness: 1, color: Colors.indigo,),
              SizedBox(height: 50,),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          // color: Colors.yellow,
                          color: Colors.black,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Education",
                            style: TextStyle(fontSize:30, fontFamily: 'Protest', fontWeight: FontWeight.bold, letterSpacing: 5, color: Colors.white70),
                          ),
                        )),
                  ),
                ],
              ),

              SizedBox(height: 20,),

              EducationContainer(level: 'Under graduation', degree: 'Bachelor of Engineering (B.E)', stream: 'Information Technology (I.T)', marks: '9.22 pointer', date: '2020 - 2024'),

              EducationContainer(level: 'Higher Secondary (H.S.C)', degree: 'XII Boards', stream: 'Science', marks: '71.54 %', date: '2019 - 2020'),
              EducationContainer(level: 'Secondary (S.S.C)', degree: 'X Boards', stream: 'Science', marks: '92.60 %', date: '2017 - 2018'),




              SizedBox(height: 50,),
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
