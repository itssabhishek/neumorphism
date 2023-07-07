import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: Center(
        child: Text(
          'Welcome',
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.displayMedium?.fontSize,
            color: Colors.yellowAccent,
          ),
        ),
      ),
    );
  }
}
