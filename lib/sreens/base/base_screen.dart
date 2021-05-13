import 'package:flutter/material.dart';
import 'package:projetolojavirtual/common/custom_drawer/custom_drawer.dart';

class BaseScreen extends StatelessWidget {
   BaseScreen({Key key}) : super(key: key);

  final PageController pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      children: [
        Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: const Text('Home'),
          ),
        ),
        Container(color: Colors.red,),
        Container(color: Colors.yellow,),
        Container(color: Colors.green,),

      ],
    );
  }
}
