import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget 
{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return  Scaffold
    (
      body: Center
      (
        child: Column
        (
          children: 
          [
            Text('Home Screen'),
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
    );
  }
}