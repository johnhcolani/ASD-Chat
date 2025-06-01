import 'package:absolute_chat/screens/chat_screen.dart';
import 'package:absolute_chat/screens/login_screen.dart';
import 'package:absolute_chat/screens/registration_screen.dart';
import 'package:absolute_chat/service/firbase_service.dart';
import 'package:absolute_chat/widgets/new_app_background.dart';
import 'package:absolute_chat/widgets/profile_background.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';


  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
   controller = AnimationController(
     duration: Duration(seconds: 1),
       vsync: this,
   upperBound: 300
   );
    super.initState();
    controller.forward();
    controller.addListener((){
      print(controller.value);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
     ProfileBackground(),
        Scaffold(
          backgroundColor: Colors.blue.withValues(alpha: controller.value),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Hero(
                      tag:'logo',
                      child: SizedBox(
                        height: controller.value,
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    ),
                    Text(
                      'A.S.D Chat',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 48.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    elevation: 5.0,
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Log In',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(30.0),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegistrationScreen.id);
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Register',
                      ),
                    ),
                  ),
                ),
                TextButton(onPressed: (){
                  FirebaseService.signInAnonymously();
                  Navigator.pushNamed(context, ChatScreen.id);
                }, child: Text('Signup Anonymously',style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue
                ),))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
