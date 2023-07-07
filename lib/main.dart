import 'package:flutter/material.dart';
import 'package:neumorphism/widget/page_1.dart';
import 'package:neumorphism/widget/page_2.dart';
import 'package:neumorphism/widget/page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _controller = PageController(keepPage: true);
  bool isFirstPage = true;
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neumorphism',
      home: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                if (index != 0) {
                  setState(() {
                    isFirstPage = false;
                  });

                  if (index != 2) {
                    setState(() {
                      isLastPage = false;
                    });
                  }
                } else {
                  setState(() {
                    isFirstPage = true;
                    isLastPage = false;
                  });
                }
              },
              children: const [
                PageOne(),
                PageTwo(),
                PageThree(),
              ],
            ),
            Container(
              alignment: const Alignment(0, 0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor:
                            isFirstPage ? Colors.grey : Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      onPressed: isFirstPage
                          ? null
                          : () {
                              _controller.previousPage(
                                duration: const Duration(milliseconds: 600),
                                curve: Curves.easeIn,
                              );
                            },
                      child: const Text(
                        'Prev',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _controller, // PageController
                    count: 3,
                    effect: const WormEffect(), // your preferred effect
                    onDotClicked: (index) {
                      _controller.jumpToPage(index);
                    },
                  ),
                  GestureDetector(
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor:
                            isLastPage ? Colors.grey : Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      onPressed: isLastPage
                          ? null
                          : () {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 600),
                                curve: Curves.easeIn,
                              );
                            },
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
