import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSocialContainer extends StatefulWidget {
  String url;
  String message;
  String imagePath;
  HomeSocialContainer({Key? key, required this.url, required this.message, required this.imagePath}) : super(key: key);

  @override
  State<HomeSocialContainer> createState() => _HomeSocialContainerState();
}

class _HomeSocialContainerState extends State<HomeSocialContainer> {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool fullScreen = width > 1815;
    bool windowed = width <= 1815 && width > 1300;

    return GestureDetector(
      onTap: (){
        _launchURL(widget.url);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white
        ),
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Tooltip(
                message: widget.message,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    widget.imagePath,
                    height: fullScreen ? 60 : windowed ? 40 : 25 ,
                  ),
                ))),
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
