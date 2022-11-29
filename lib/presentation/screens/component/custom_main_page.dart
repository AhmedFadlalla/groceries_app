import 'package:flutter/material.dart';

class CustomMainPage extends StatelessWidget {
  final Widget widget;
  const CustomMainPage({
    Key? key,
    required this.widget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
           Image(image:AssetImage('assets/images/front.png') ),
            Image(image:AssetImage('assets/images/bottom.png') ),
            widget,
          ],
        ),
      ),
    );
  }
}
