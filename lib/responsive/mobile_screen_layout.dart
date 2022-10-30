import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:instagram_clone/models/user.dart' as model;
class MobileSCreenLayout extends StatefulWidget 
{
  const MobileSCreenLayout({super.key});

  @override
  State<MobileSCreenLayout> createState() => _MobileSCreenLayoutState();
}

class _MobileSCreenLayoutState extends State<MobileSCreenLayout> 
{

  @override
  Widget build(BuildContext context) 
  {
    model.User user=Provider.of<UserProvider>(context).getUser;
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
                Text(user.username),
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