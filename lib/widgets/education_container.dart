import 'package:flutter/material.dart';
import 'package:myportfolioflutter/colors/colors.dart';

class EducationContainer extends StatefulWidget {

  String level;
  String degree;
  String stream;
  String marks;
  String date;

  EducationContainer(
      {
        Key? key,
        required this.level,
        required this.degree,
        required this.stream,
        required this.marks,
        required this.date,
      }) : super(key: key);

  @override
  State<EducationContainer> createState() => _EducationContainerState();
}

class _EducationContainerState extends State<EducationContainer> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return
      Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: MouseRegion(
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
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Container(
                height: 100,
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.mainbk1,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: isHovered ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(widget.degree, style: TextStyle(fontFamily: 'Anta', color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
                    Text(widget.stream, style: TextStyle(fontFamily: 'Anta', color: Colors.white, fontSize: 20),),
                    Text(widget.marks, style: TextStyle(fontFamily: 'Anta', color: Colors.white, fontSize: 20),),
                    Text(widget.date, style: TextStyle(fontFamily: 'Anta', color: Colors.white, fontSize: 20),),
                  ],
                )
                    :
    Row(
      children: [
        Text(widget.level, style: TextStyle(fontFamily: 'Anta', color: Colors.white, fontSize: 20),),
      ],
    )
              ),
            ),
            ),
          );
  }
}
