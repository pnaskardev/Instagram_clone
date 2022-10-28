import 'package:flutter/material.dart';

class MobileSCreenLayout extends StatelessWidget 
{
  const MobileSCreenLayout({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return const SafeArea
    (
      child:  Scaffold
      (
        body: Center
        (
          child: Text('this is mobile'),
        ),
      ),
    );
  }
}