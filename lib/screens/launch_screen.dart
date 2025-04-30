import 'dart:async';

import 'package:flutter/material.dart';
import 'package:free_dividend/screens/home_screen.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 4,
              child: Center(
                child: Icon(
                  Icons.airplane_ticket_outlined,
                  size: 250,
                  color: Colors.green.shade200,
                ),
              ),
            ),
            Flexible(
              child: Center(
                child: Text(
                  '잠시후 홈 화면으로 이동합니다...',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
