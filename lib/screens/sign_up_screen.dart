import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/text_fied_input.dart';

class SignUpScreen extends StatefulWidget 
{
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> 
{

  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _bioController=TextEditingController();
  final TextEditingController _usernameController=TextEditingController();

  @override
  void dispose() 
  {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      body: SafeArea
      (
        child: Container
        (
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column
          (
            crossAxisAlignment: CrossAxisAlignment.center,
            children: 
            [
              // svg image
              Flexible
              (
                flex: 3,
                child: Container(),
              ),
              SvgPicture.asset
              (
                'assets/ic_instagram.svg',
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(height: 64,),

              Stack
              (
                children:  
                [
                  const CircleAvatar
                  (
                    radius: 64,
                    backgroundImage: NetworkImage('https://images.unsplash.com/photo-1659535832621-4ef57c0e141b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2072&q=80'),
                  ),
                  Positioned
                  (
                    bottom: -10,
                    left: 80,
                    child: IconButton
                    ( 
                      onPressed: (){}, 
                      icon: const Icon(Icons.add_a_photo)
                    )
                  )
                ],
                
              ),
              const SizedBox(height: 24,),
              TextFieldInput
              (
                hintText: 'Enter your username',
                textInputType: TextInputType.text,
                textEditingController: _usernameController,
              ),
              const SizedBox(height: 24,),
              // email
              TextFieldInput
              (
                hintText: 'Enter your Email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              const SizedBox(height: 24,),
              // password
              TextFieldInput
              (
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPass: true,
              ),
              const SizedBox(height: 24,),
              TextFieldInput
              (
                hintText: 'Enter your bio',
                textInputType: TextInputType.text,
                textEditingController: _bioController,
              ),
              const SizedBox(height: 24,),
              // button login
              Container
              (
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric
                (
                  vertical: 12
                ),
                decoration: const ShapeDecoration
                (
                  shape: RoundedRectangleBorder
                  (
                    borderRadius: BorderRadius.all(Radius.circular(4))
                  ),
                  color: Colors.blue
                ),
                child: const Text('SignUp'),
              ),
              Flexible(flex: 2,child: Container(),)
            ],
          ),
        ),
      ),
    ); 
  }
}