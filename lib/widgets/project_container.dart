import 'dart:html';

import 'package:flutter/material.dart';
import 'package:myportfolioflutter/colors/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

class ProjectContainer extends StatefulWidget {
  String title;
  String date;
  String domain;
  String description;
  String type;
  String imagePath;
  String url;

  ProjectContainer(
      {
        Key? key,
        required this.title,
        required this.date,
        required this.domain,
        required this.description,
        required this.type,
        required this.imagePath,
        required this.url
      }) : super(key: key);

  @override
  State<ProjectContainer> createState() => _ProjectContainerState();
}

class _ProjectContainerState extends State<ProjectContainer> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    bool fullScreen = width > 1815;
    bool windowed = width <= 1815 && width > 1300;

    return Center(
      child: MouseRegion(
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
            width: fullScreen ? 500 : windowed ? 350 : 300,
            height: fullScreen ? 500 : null,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isHovered ? AppColors.mainbk1 : AppColors.mainbk2
            ),
            child:
            Stack(
              children: [
                Center(
                  child: Opacity(
                    opacity: isHovered ? 0.15 : 0.8,
                    child: Image.asset(
                      widget.imagePath,
                      fit: BoxFit.cover, // Adjust the BoxFit property as per your need
                      height: fullScreen ? 350.0 : windowed ? 200 : 150, // Adjust the height as per your need
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
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.mainbk3,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fullScreen ? 20 : windowed? 15 : 12,
                                color: Colors.white,
                                fontFamily: 'Anta'
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: (){
                                _launchURL(widget.url);
                              },
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                    child: Tooltip(
                                      message: 'Open code of this project',
                                        textStyle: TextStyle( color: Colors.white, fontFamily: 'Anta'),
                                        child: Icon(Icons.open_in_new_rounded, color: Colors.white,))
                                )
                            )


                          ],
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
                            "Project type: ",
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
                              widget.type,
                              style: TextStyle(color: Colors.white, fontFamily: 'Urbanist', fontSize: 20),
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
                            "Domain: ",
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
                            widget.domain,
                            style: TextStyle(color: Colors.white, fontFamily: 'Urbanist', fontSize: 20),
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
                            "Project description: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                                fontFamily: 'Urbanist',
                              fontSize: fullScreen ? 18 : windowed? 15 : 12,


                            ),
                          ),
                        ],
                      ),
                      Wrap(
                        children: [
                          Text(
                            widget.description,
                            style: TextStyle(color: Colors.white, fontFamily: 'Urbanist', fontSize: 20),
                          ),
                        ],
                      ),

                      const Divider(
                        thickness: 0.2,
                        color: Colors.grey,
                      ),

                      // Container(
                      //   padding: EdgeInsets.all(16),
                      //   decoration: BoxDecoration(
                      //     color: AppColors.mainbk3,
                      //     borderRadius: BorderRadius.circular(16),
                      //   ),
                      //   child: Image.asset(
                      //     widget.imagePath,
                      //     fit: BoxFit.cover, // Adjust the BoxFit property as per your need
                      //     height: 50.0, // Adjust the height as per your need
                      //   ),
                      // ),



                    ],
              ),
                  ),
                )
              ],
            )
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
