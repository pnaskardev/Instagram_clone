import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
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
  Uint8List? _image;
  bool _isLoading=false;
  
  void navigateToLogin() 
  {
    Navigator.of(context).pushReplacement
    (
      MaterialPageRoute
      (
        builder: (context)=>const LoginScreen()
      )
    );
  }

  void signUpUser() async
  {
    setState(() 
    {
      _isLoading=true;  
    });
    String res= await AuthMethods().signUpUser
    (
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      bio: _bioController.text,
      file: _image!
    );
    // ignore: avoid_print
    print(res);
    setState(() 
    {
      _isLoading=false;  
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

  void selectImage() async
  {
   Uint8List im = await pickImage(ImageSource.gallery);
   setState(() 
   {
    _image=im;
   });
  }

  
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
          
              Stack
              (
                children:  
                [
                  _image!=null ? 
                  CircleAvatar
                  (
                    
                    radius: 64,
                    backgroundImage: MemoryImage(_image!)
                  )
                  :
                  const CircleAvatar
                  (
                    
                    radius: 64,
                    backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzqGOUFZhs9hHrQLOsrjnRYJwZGk3xIXG3HA9McMcV&s'),
                  ),
                  Positioned
                  (
                    bottom: -10,
                    left: 80,
                    child: IconButton
                    ( 
                      onPressed: ()
                      {
                        selectImage();
                      }, 
                      icon: const Icon(Icons.add_a_photo_sharp)
                    )
                  )
                ],
                
              ),
              const SizedBox(height: 24,),
              Column
              (
                children: 
                [
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
                  InkWell
                  (
                    onTap: signUpUser,
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
                      child: _isLoading ? 
                      const Center
                      (
                        child: CircularProgressIndicator
                        (
                          color: primaryColor,
                        ),
                      ) 
                      : 
                      const Text('SignUp'),
                    ),
                  ),
                ],
              ),

              Flexible(flex: 2,child: Container(),),
              Row
              (
                mainAxisAlignment: MainAxisAlignment.center,
                children: 
                [
                  Container
                  (
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text('Already have an account?'),
                  ),
                  
                  
                  InkWell
                  (
                    onTap: navigateToLogin,
                    child: Container
                    (
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text
                      (
                        'Sign in',
                        style: TextStyle
                        (
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ); 
  }

  
}