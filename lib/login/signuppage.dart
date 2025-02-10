import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartmess/login/snackbar.dart';
import 'package:smartmess/services/myfirebase.dart';
import '../pages/home.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading=false;
@override
void despose(){
  super.dispose();
  email.dispose();
  password.dispose();
  name.dispose();
}
  void signUpUser(BuildContext context) async {
    String res = await Authservices().signUpUser(
      email: email.text,
      password: password.text,
      name: name.text,
    );

    if (res == "success") {
      setState(() {
        isLoading=true;
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else {
      setState(() {
        isLoading=false;
      });
     showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 200),
            Text(
              "Create Account",
              style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Please sign up to continue!",
              style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.grey),
            ),
            SizedBox(height: 40),
            TextFormField(
              controller: name,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: "Full Name",
                hintText: "Enter Full Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: "Email",
                hintText: "Enter Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: password,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: "Password",
                hintText: "Enter Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => signUpUser(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Sign Up",
                style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(fontFamily: 'Urbanist'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontFamily: 'Urbanist', color: Colors.orange),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
