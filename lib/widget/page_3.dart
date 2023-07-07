import 'package:flutter/material.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Center(
        child: Text(
          'To my App',
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.displayMedium?.fontSize,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
