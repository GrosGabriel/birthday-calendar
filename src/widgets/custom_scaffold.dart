import 'package:flutter/material.dart';





class CustomScaffold extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  

  CustomScaffold({required this.child, this.appBar, this.bottomNavigationBar, this.drawer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: SizedBox(
          width: 960,
          child: child,
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
      drawer: drawer,
    );
  }
}

