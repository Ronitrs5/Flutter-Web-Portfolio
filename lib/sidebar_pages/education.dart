import 'package:flutter/material.dart';
import 'package:myportfolioflutter/colors/colors.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainbk3,
      appBar: AppBar(
        title: Text("Education"),
      ),
    );
  }
}
