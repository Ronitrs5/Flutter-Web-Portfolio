import 'package:flutter/material.dart';
import 'package:myportfolioflutter/colors/colors.dart';
import 'package:myportfolioflutter/widgets/project_container.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    bool fullScreen = width > 1815;
    bool windowed = width <= 1815 && width > 1300;

    return Scaffold(
      backgroundColor: AppColors.mainbk3,

      body: DottedBackgroundContainer(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              MouseRegion(
                cursor: SystemMouseCursors.click,
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

                child: AnimatedContainer(
                    duration: Duration(milliseconds: 600),
                    curve: Curves.easeIn,
                    padding: EdgeInsets.all(100),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      color: isHovered ? Colors.black : AppColors.mainbk4,
                    ),
                    child:
                    isHovered ?

                    Text('Projects are cool\n'
                        'Tap to see\n'
                        'Code for this portfolio',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Anta',
                        letterSpacing: fullScreen ? 10 : windowed ? 5 : 2,
                        fontSize: fullScreen ? 30 : windowed ? 20 : 15,
                      ),
                    ):
                    Text('Personal &\nProfessional\nProjects', style: TextStyle(color: Colors.white, fontFamily: 'Anta', letterSpacing: fullScreen ? 10 : windowed ? 5 : 2,
                      fontSize: fullScreen ? 30 : windowed ? 20 : 15,),
                    )
                ),
              ),
              SingleChildScrollView(
                child: fullScreen || windowed ?
                Column(
                  children: [
                    SizedBox(height: 50,),

                    Row(
                      children: [
                        ProjectContainer(
                            title: 'Sakha Swad',
                            date: 'April 2024',
                            domain: 'Flutter cross platform app',
                            description: "A project made for a restaurant's customer giving them ability to view the menu and book food online.",
                          type: 'Freelancing project for a restaurant',
                          imagePath: 'assets/images/icon_ss.png',
                          url: 'https://github.com/Ronitrs5?tab=repositories',
                        ),

                        SizedBox(width: 50,),
                        ProjectContainer(
                            title: 'Event Horizon',
                            date: 'March 2024',
                            domain: 'Flutter cross platform app',
                            description: "Cross platform application made for our college where students can gain information about college messes, bookstores, scholarships. ",
                                // "Students will be notified when new events are posted."
                                // "We have also integrated an AI chatbot for placement assistance for students across all engineering streams",
                          type: "College's final year project",
                          imagePath: 'assets/images/icon_eh.png',
                          url: 'https://github.com/Ronitrs5/Final-year-project',

                        ),
                      ],
                    ),

                    SizedBox(height: 50,),


                    Row(
                      children: [
                        ProjectContainer(
                            title: 'Nagar Palika ERP',
                            date: 'Sept 2023',
                            domain: 'Flutter cross platform app',
                            description:"This cross platform application is made for Municipal corporation of Icchalkaranji for collecting information about daily trash disposal of people.",
                                // "I have used QR code and Google Maps APIs inside this application.",
                          type: 'Freelancing project for a Municipal Corporation',
                          imagePath: 'assets/images/icon_erp.png',
                          url: 'https://github.com/Ronitrs5/Nagarpalika-ERP/tree/master',

                        ),

                        SizedBox(width: 50,),

                        ProjectContainer(
                            title: 'Safe To Home',
                            date: 'Aug 2023',
                            domain: 'Android Development',
                            description: "It was an application made for women which addresses their safety. "
                                "It uses phone's accelerometer to detect any unusual activity and activate the emergency protocols.",
                          type: 'Personal Project',
                          imagePath: 'assets/images/icon_sth.png',
                          url: 'https://github.com/Ronitrs5/Safe-to-home',

                        ),
                      ],
                    ),
                  ],
                )
                    :

                Column(
                  children: [
                    SizedBox(height: 50,),

                    ProjectContainer(
                      title: 'Sakha Swad',
                      date: 'April 2024',
                      domain: 'Flutter cross platform app',
                      description: "A project made for a restaurant's customer giving them ability to view the menu and book food online.",
                      type: 'Freelancing project for a restaurant',
                      imagePath: 'assets/images/icon_ss.png',
                      url: 'https://github.com/Ronitrs5?tab=repositories',
                    ),

                    SizedBox(height: 50,),

                    ProjectContainer(
                      title: 'Event Horizon',
                      date: 'March 2024',
                      domain: 'Flutter cross platform app',
                      description: "Cross platform application made for our college where students can gain information about college messes, bookstores, scholarships. ",
                      // "Students will be notified when new events are posted."
                      // "We have also integrated an AI chatbot for placement assistance for students across all engineering streams",
                      type: "College's final year project",
                      imagePath: 'assets/images/icon_eh.png',
                      url: 'https://github.com/Ronitrs5/Final-year-project',

                    ),

                    SizedBox(height: 50,),


                    ProjectContainer(
                      title: 'Nagar Palika ERP',
                      date: 'Sept 2023',
                      domain: 'Flutter cross platform app',
                      description:"This cross platform application is made for Municipal corporation of Icchalkaranji for collecting information about daily trash disposal of people.",
                      // "I have used QR code and Google Maps APIs inside this application.",
                      type: 'Freelancing project for a Municipal Corporation',
                      imagePath: 'assets/images/icon_erp.png',
                      url: 'https://github.com/Ronitrs5/Nagarpalika-ERP/tree/master',

                    ),

                    SizedBox(height: 50,),


                    ProjectContainer(
                      title: 'Safe To Home',
                      date: 'Aug 2023',
                      domain: 'Android Development',
                      description: "It was an application made for women which addresses their safety. "
                          "It uses phone's accelerometer to detect any unusual activity and activate the emergency protocols.",
                      type: 'Personal Project',
                      imagePath: 'assets/images/icon_sth.png',
                      url: 'https://github.com/Ronitrs5/Safe-to-home',

                    ),
                  ],
                ),
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

