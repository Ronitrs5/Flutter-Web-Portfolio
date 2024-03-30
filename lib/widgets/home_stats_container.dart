import 'package:flutter/material.dart';

class HomeStatsContainer extends StatefulWidget {

  String message;
  String number;
  String description;
  HomeStatsContainer({Key? key, required this.message, required this.number, required this.description}) : super(key: key);

  @override
  State<HomeStatsContainer> createState() => _HomeStatsContainerState();
}

class _HomeStatsContainerState extends State<HomeStatsContainer> {

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool fullScreen = width > 1815;
    bool windowed = width <= 1815 && width > 1300;

    return Tooltip(
      message: widget.message,
      textStyle: TextStyle(
          fontFamily: 'Anta',
          color: Colors.white
      ),
      decoration: BoxDecoration(
          color: Colors.black
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(
              widget.number,
              style: TextStyle(
                  fontSize: fullScreen ? 30 : windowed ? 24 : 20,
                  fontWeight: FontWeight.bold, fontFamily: 'Protest'),
            ),
            Text(widget.description, style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold,))
          ],
        ),
      ),
    );
  }
}
