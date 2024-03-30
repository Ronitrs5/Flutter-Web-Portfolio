import 'package:flutter/material.dart';
import 'package:myportfolioflutter/colors/colors.dart';

class LanguageWidget extends StatelessWidget {
  final String imagePath;
  final String labelText;

  const LanguageWidget({Key? key, required this.imagePath, required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.mainbk1
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(imagePath, width: 80,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFFa7c7cb)
                      ),

                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                        child: Text(labelText, style: TextStyle(fontFamily: 'Protest'),
                        ),
                      )
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
