import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MobileSCreenLayout extends StatelessWidget 
{
  const MobileSCreenLayout({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return  SafeArea
    (
      child: Scaffold
      (
        body: Center
        (
          child: Column
          (
            children: 
            [
                Text('This is mobile'),
                ElevatedButton
                (
                  onPressed: () async
                  {
                    await FirebaseAuth.instance.signOut();
                  }, 
                  child: Text('logout')
                )
            ],
          ),
        ),
      ),
    );
  }
}