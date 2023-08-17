import 'package:flutter/material.dart';
import 'package:market_app/screens/Log_in.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Widgets/PaddingButtons.dart';
import '../constant.dart';
import 'Home.dart';
import 'package:market_app/provider/Auth.dart';

class SignIn_page extends StatefulWidget {
  SignIn_page({Key? key}) : super(key: key);

  @override
  State<SignIn_page> createState() => _SignIn_pageState();
}

class _SignIn_pageState extends State<SignIn_page> {
  late String email, password, phoneNumber;

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
                        'Register',
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
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration.copyWith(hintText: "Phone"),
                onChanged: (value) {
                  phoneNumber = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              RoundedButton(
                color: kLoginButtonColor,
                onPressed: () async {
                  showSpinner = true;

                  try {
                    final signUp_user =
                        await auth.signUp(email, password, phoneNumber);
                    setState(() {
                      showSpinner = false;
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Home(),
                      ),
                    );
                    setState(() {
                      showSpinner = false;
                    });
                  } on Exception catch (e) {
                    setState(() {
                      showSpinner = false;
                    });
                    print(e);
                  }
                },
                text: 'sign up',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have account ? '),
                  InkWell(
                    child: Text(
                      'Log in',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => LogIn_Page(),
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
                height: 40,
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
