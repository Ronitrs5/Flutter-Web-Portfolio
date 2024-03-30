import 'package:flutter/material.dart';
import 'package:myportfolioflutter/colors/colors.dart';
import 'package:myportfolioflutter/widgets/work_container.dart';


class Work extends StatefulWidget {
  const Work({super.key});

  @override
  State<Work> createState() => _WorkState();
}

class _WorkState extends State<Work> {
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
                    child: isHovered ?

                    Text('Debugging is a task\nCoding is a work\nI love both\nI love tech chaos',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Anta',
                        letterSpacing: fullScreen ? 10 : windowed ? 5 : 2,
                        fontSize: fullScreen ? 30 : windowed ? 20 : 15,
                      ),
                    ):

                    Text('Work\nExperience\n&\nInternships',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Anta',
                          letterSpacing: fullScreen ? 10 : windowed ? 5 : 2,
                          fontSize: fullScreen ? 30 : windowed ? 20 : 15,
                      ),
                    )
                ),
              ),




              Visibility(
                visible: fullScreen || windowed,
                child: Row(
                  children: [
                    SizedBox(height: 50,),
                    WorkContainer(
                        position: 'Mobile Developer Freelance',
                        date: 'Sep 2023 - Today',
                        company: "Freelance",
                        skills: "•Flutter  •Android Studio  •UI/UX Designing  •API Integration",
                        details: "I am working as a mobile developer freelancer and have completed 3 projects and contributed in some projects by working on some modules.",
                      imagePath: 'assets/images/freelancer.png',
                    ),

                    SizedBox(width: 50,),

                    WorkContainer(
                        position: 'Android Developer Intern',
                        date: 'Feb 2023 - Apr 2023',
                        company: "Infort Technology Pvt Ltd",
                        skills: "•Android Development  •Android Studio  •Java  •Kotlin  •XML  •Firebase  •Firebase ML Kit  •Google APIs  •API Integration",
                        details: "Collaborated with a team of developers to design and deploy 2 major projects-\n"
                            " • Face Recognition Attendance System.\n • Event Management Application.\n"
                            "In parallel with the internship, worked as an Android trainer and conducted a 3 days Android Workshop at Indhira Polytechnic College, Ahmednagar.",
                      imagePath: 'assets/images/icon_android.png',
                    ),
                  ],
                ),
              ),

              Visibility(
                visible: !fullScreen && !windowed,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 50,),
                      WorkContainer(
                        position: 'Mobile Developer Freelance',
                        date: 'Sep 2023 - Today',
                        company: "Freelance",
                        skills: "•Flutter  •Android Studio  •UI/UX Designing  •API Integration",
                        details: "I am working as a mobile developer freelancer and have completed 3 projects and contributed in some projects by working on some modules.",
                        imagePath: 'assets/images/freelancer.png',
                      ),

                      SizedBox(height: 50,),

                      WorkContainer(
                        position: 'Android Developer Intern',
                        date: 'Feb 2023 - Apr 2023',
                        company: "Infort Technology Pvt Ltd",
                        skills: "•Android Development  •Android Studio  •Java  •Kotlin  •XML  •Firebase  •Firebase ML Kit  •Google APIs  •API Integration",
                        details: "Collaborated with a team of developers to design and deploy 2 major projects-\n"
                            " • Face Recognition Attendance System.\n • Event Management Application.\n"
                            "In parallel with the internship, worked as an Android trainer and conducted a 3 days Android Workshop at Indhira Polytechnic College, Ahmednagar.",
                        imagePath: 'assets/images/icon_android.png',
                      ),
                    ],
                  ),
                ),
              ),

              // Text('Internship', style: TextStyle(color: Colors.white, fontFamily: 'Anta', letterSpacing: 10, fontSize: 30, backgroundColor: AppColors.mainbk3),),
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

