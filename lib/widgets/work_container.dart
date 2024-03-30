import 'package:flutter/material.dart';
import 'package:myportfolioflutter/colors/colors.dart';

class WorkContainer extends StatefulWidget {
  final String position;
  final String date;
  final String company;
  final String skills;
  final String details;
  final String imagePath;

  const WorkContainer({
    Key? key,
    required this.position,
    required this.date,
    required this.company,
    required this.skills,
    required this.details,
    required this.imagePath,
  }) : super(key: key);

  @override
  _WorkContainerState createState() => _WorkContainerState();
}

class _WorkContainerState extends State<WorkContainer> {

  bool isHovered = false;


  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    bool fullScreen = width > 1815;
    bool windowed = width <= 1815 && width > 1300;

    return MouseRegion(

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

      child: Center(
        child: AnimatedContainer(
            duration: Duration(milliseconds: 600), // Adjust the duration as per your preference
            curve: Curves.easeInOut, //
          padding: EdgeInsets.all(16),
          width: isHovered && fullScreen ? 600 : isHovered && windowed? 400 : !isHovered && fullScreen ? 400 : !isHovered && windowed ? 300 : !isHovered && !windowed?  200 : 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isHovered ? AppColors.mainbk1 : AppColors.mainbk2
          ),

          child:
          Stack(
            children: [

              AnimatedContainer(
          duration: Duration(milliseconds: 600), // Adjust the duration as per your preference
            curve: Curves.easeInOut,
                child: Center(
                  child: Opacity(
                    opacity: isHovered ? 0.15 : 0.8,
                    child: Image.asset(
                      widget.imagePath,
                      fit: BoxFit.cover, // Adjust the BoxFit property as per your need
                      height: isHovered && fullScreen ? 600 : isHovered && windowed? 400 : !isHovered && fullScreen ? 400 : !isHovered && windowed ? 300 : 200,
                    ),
                  ),
                ),
              ),

              AnimatedOpacity(
                opacity: isHovered ? 1.0 : 0.0,
                duration: Duration(milliseconds: 600), // Adjust the duration as per your preference
                curve: Curves.easeInOut,
                child: Visibility(
                  visible: isHovered,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.mainbk4,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          widget.position,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: fullScreen ? 20 : windowed? 15 : 12,
                            letterSpacing: 5,
                            color: Colors.white,
                            fontFamily: 'Urbanist'
                          ),
                        ),
                      ),
                      SizedBox(height: 16,),

                      Row(
                        children: [
                          Text(
                            "Date: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange,
                                fontFamily: 'Urbanist',
                              fontSize: fullScreen ? 18 : windowed? 15 : 12,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            widget.date,
                            style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Urbanist'),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 0.2,
                        color: Colors.grey,
                      ),

                      Row(
                        children: [
                          Text(
                            "Company: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange,
                                fontFamily: 'Urbanist',
                              fontSize: fullScreen ? 18 : windowed? 15 : 12,

                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [

                          Text(
                            widget.company,
                            style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Urbanist'),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 0.2,
                        color: Colors.grey,
                      ),
                       Row(
                        children: [
                          Text(
                            "Skills: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange,
                                fontFamily: 'Urbanist',
                              fontSize: fullScreen ? 18 : windowed? 15 : 12,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.skills,
                              style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Urbanist'),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 0.2,
                        color: Colors.grey,
                      ),
                      Row(
                        children: [
                          Text(
                            "Project Details: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange,
                                fontFamily: 'Urbanist',
                              fontSize: fullScreen ? 18 : windowed? 15 : 12,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.details,
                              style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Urbanist'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]
          )
        ),
      ),
    );
  }
}
