import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/intro2.jpg"), fit: BoxFit.cover),
              ),
            ),
            Positioned(
                top: 70,
                right: 78,
                left: 78,
                child: Text(
                  "PERFUME",
                  style: GoogleFonts.aboreto(
                      fontSize: 45,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
            Positioned(
                top: 120,
                right: 85,
                left: 85,
                child: Text(
                  "Listen to your heart",
                  style: GoogleFonts.acme(fontSize: 23, color: Colors.white24),
                )),
            Positioned(
              bottom: 20,
              left: 40,
              right: 40,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/homepage');
                },
                child: Container(
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Text(
                    "Get Started",
                    style: GoogleFonts.acme(fontSize: 23, color: Colors.white),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
