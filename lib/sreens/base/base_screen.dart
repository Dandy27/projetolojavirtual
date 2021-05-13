import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({Key key}) : super(key: key);

  final PageController pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      children: [
        Container(color: Colors.red,),
        Container(color: Colors.yellow,),
        Container(color: Colors.green,),

      ],
    );
  }
}
