import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:instagram_clone/screens/home_screen.dart';
import 'package:instagram_clone/screens/sign_up_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/text_fied_input.dart';

class LoginScreen extends StatefulWidget 
{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> 
{

  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  bool _isLoading =  false;
  void loginUser() async
  {
    setState(() 
    {
      _isLoading = true;  
    });
    String res= await AuthMethods().loginUser
    (
      email: _emailController.text,
      password: _passwordController.text,
    );
    setState(() 
    {
      _isLoading = false;  
    });
    if(res !='success')
    {
      // ignore: use_build_context_synchronously
      showSnackBar(res, context);
    }
    else
    {
      Navigator.of(context).pushReplacement
      (
        MaterialPageRoute
        (
          builder: (context)=>const ResponsiveLayout
          (
            webScreenLayout: WebScreenLayout(), 
            mobileScreenLayout: MobileSCreenLayout()
          )
        )
      );
    }
  }

  void navigateToSignUp()
  {
    Navigator.of(context).pushReplacement
    (
      MaterialPageRoute
      (
        builder: (context)=>const SignUpScreen()
      )
    );
  }

  @override
  void dispose() 
  {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      resizeToAvoidBottomInset: false,
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
              // button login
              InkWell
              (
                onTap: loginUser,
                child: Container
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
                  child:_isLoading ? 
                    const Center
                    (
                      child: CircularProgressIndicator
                      (
                        color: primaryColor,
                      ),
                    )
                    : 
                    const Text
                    (
                      'Log-in',
                      style: TextStyle
                      (
                        fontWeight: FontWeight.bold
                      ),
                    ),
                ),
              ),
              const SizedBox(height: 12,),
              Flexible(flex: 2,child: Container(),),
              Row
              (
                mainAxisAlignment: MainAxisAlignment.center,
                children: 
                [
                  Container
                  (
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text('Dont you have an account'),
                  ),
                  
                  
                  InkWell
                  (
                    onTap: navigateToSignUp,
                    child: Container
                    (
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child:const Text
                      (
                        'Sign up',
                        style: TextStyle
                        (
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  )
                ],
              )
              // transitioning to sign up page
            ],
          ),
        ),
      ),
    ); 
  }
}