import 'package:flutter/material.dart';
import 'sign_in_screen.dart'; // Import the Sign In screen

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          color: Color(0xFF100425),
        ),
        child: Stack(
          children: [
            // Background image
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: screenWidth,
                height: screenHeight,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Bot image
            Positioned(
              left: screenWidth * 0.17,
              top: screenHeight * 0.35,
              child: Container(
                width: screenWidth * 0.6,
                height: screenHeight * 0.4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bot1.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            // Title text lowered slightly
            Positioned(
              left: screenWidth * 0.2,
              top: screenHeight * 0.14, // Adjusted from 0.15 to 0.1
              child: SizedBox(
                width: screenWidth * 0.6,
                child: Text(
                  'Best Personal\n  AI Assistant',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.08,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            // Ellipse behind version text, moved to the right
            Positioned(
              left: screenWidth * 0.51 - 61.5, // Moved more to the right (adjusted position)
              top: screenHeight * 0.8 - 20, // Positioned correctly
              child: Transform(
                transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-0.01),
                child: Container(
                  width: 123,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Color(0xFF0F070E),
                    shape: OvalBorder(),
                  ),
                ),
              ),
            ),
            // Version text centered inside the ellipse
            Positioned(
              left: screenWidth * 0.62 - 61.5, // Moved more to the right (adjusted position)
              top: screenHeight * 0.81 - 20, // Corrected vertical alignment
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'v1.23',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.05,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            // "Nice to meet you! How can I help you?" text, in one line and aligned under the ellipse
            Positioned(
              left: screenWidth * 0.2,
              top: screenHeight * 0.8 + 30, // Positioned below the ellipse with more space
              child: SizedBox(
                width: screenWidth * 0.6,
                child: Text(
                  'Nice to meet you! How can I help you?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.04,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis, // Ensure text stays in one line
                  ),
                ),
              ),
            ),
            // Get Started Button
            Positioned(
              left: screenWidth * 0.15,
              top: screenHeight * 0.9,
              child: GestureDetector(
                onTap: () {
                  // Navigate to Sign In screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                  );
                },
                child: Container(
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.07,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.05,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
