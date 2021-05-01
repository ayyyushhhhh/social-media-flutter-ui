import 'package:flutter/material.dart';
import 'package:social_media_ui/Screens/home_screen.dart';
import 'package:social_media_ui/widgets/curve_clipper.dart';

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            ClipPath(
              clipper: CurveClipper(),
              child: Image(
                height: MediaQuery.of(context).size.height / 2.5,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/login_background.jpg'),
              ),
            ),
            Text(
              'FRENZY',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "UserName",
                  prefixIcon: Icon(
                    Icons.account_box,
                    size: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Password",
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return HomeScreen();
                }));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                height: 45,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                    child: Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                )),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    height: 80,
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      "Don't have an account? Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
