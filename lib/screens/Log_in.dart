// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:market_app/constant.dart';
import 'package:market_app/screens/Sign_up.dart';
import 'dart:async';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:flutter/material.dart';

import '../Widgets/PaddingButtons.dart';
import '../provider/Auth.dart';
import 'Home.dart';

class LogIn_Page extends StatefulWidget {
  const LogIn_Page({Key? key}) : super(key: key);

  @override
  _LogIn_PageState createState() => _LogIn_PageState();
}

class _LogIn_PageState extends State<LogIn_Page> {
  late String email, password;
  bool showSpinner = false;
  Authintcation auth = Authintcation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .25,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image(
                      image: AssetImage('asset/buyicon.png'),
                    ),
                    Positioned(
                      bottom: 10,
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration:
                    kTextFieldDecoration.copyWith(hintText: "Email Adress"),
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration.copyWith(hintText: "Password"),
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              RoundedButton(
                color: kLoginButtonColor,
                onPressed: () async {
                  try {
                    final loginUser = await auth.signIn(email, password);
                    if (loginUser != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Home(),
                        ),
                      );
                      setState(() {
                        showSpinner = false;
                      });
                    }
                  } on Exception catch (e) {
                    setState(() {
                      showSpinner = false;
                    });
                    print(e);
                  }
                },
                text: 'Log In',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have account ? '),
                  InkWell(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => SignIn_page(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Center(child: Text('OR Continue With..')),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'asset/download1.png',
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Image.asset(
                    'asset/download2.png',
                    height: 40,
                    width: 35,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Image.asset(
                    'asset/download3.png',
                    height: 40,
                    width: 30,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
