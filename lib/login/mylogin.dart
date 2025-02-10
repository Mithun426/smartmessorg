import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartmess/login/signuppage.dart';
import 'package:smartmess/login/snackbar.dart';
import 'package:smartmess/pages/dashboard.dart';

import '../pages/home.dart';
import '../services/myfirebase.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;

  void despose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  // void loginUser(BuildContext context) async {
  //   String res = await Authservices().loginUser(
  //     email: email.text,
  //     password: password.text,

  //   );

  //   if (res == "success") {
  //     setState(() {
  //       isLoading=true;
  //     });
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) => Home()),
  //     );
  //   } else {
  //     setState(() {
  //       isLoading=false;
  //     });
  //     showSnackBar(context, res);
  //   }
  // }
  void login() async {
    final authService = Authservices();
    var user = await authService.login(
      email.text,
      password.text,
    );
    if (user != null) {
      print("Login Successful: ${user.email}");
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return Myfoodpage();
      }));
    } else {
      print("Login Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Center(
                    child: Text(
                      "Smart Mess",
                      style: TextStyle(
                        fontFamily: 'Sofia',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/smlogo.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    "Hello,",
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 24,
                        color: Colors.grey),
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      labelText: "Email",
                      hintText: "Enter Email",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.length == 0) {
                        return "Please enter your email";
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: password,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        onPressed: _togglePasswordVisibility,
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: _obscureText ? Colors.grey : Colors.black87,
                        ),
                      ),
                      labelText: "Enter Password",
                      hintText: "Enter Password",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.length == 0) {
                        return "Enter the Password";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            fontFamily: 'Urbanist', color: Colors.orange),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        login();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign In",
                          style: TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: Divider(thickness: 1)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Or"),
                      ),
                      Expanded(child: Divider(thickness: 1)),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/go.webp',
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Continue with Google",
                            style: TextStyle(
                                fontFamily: 'Urbanist',
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account? ",
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage()),
                          );
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              fontFamily: 'Urbanist', color: Colors.orange),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
