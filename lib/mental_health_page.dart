import 'package:flutter/material.dart';
import 'breathing_exercises_page.dart'; // Updated import for CustomizePage
import 'chat_page.dart'; // Updated import for CustomizePage
import 'feeling_page.dart'; // Updated import for CustomizePage



class MentalHealthPage extends StatelessWidget {
  const MentalHealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Positioned.fill(
          child: Image.asset(
            "assets/background.png",
            fit: BoxFit.cover,
          ),
        ),

        // Main Content with Transparent Scaffold
        Scaffold(
          backgroundColor: Colors.transparent, // Make Scaffold transparent
          extendBodyBehindAppBar: true, // Extend background behind AppBar
          appBar: AppBar(
            backgroundColor: Colors.transparent, // Transparent AppBar
            elevation: 0, // No shadow
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              'Mental Health',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: const Column(
            children: [
              MentalHealthContent(),
            ],
          ),
        ),
      ],
    );
  }
}

class MentalHealthContent extends StatelessWidget {
  const MentalHealthContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.png"), // Background image
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Main Heading
          Positioned(
            left: 27,
            top: 100, // Adjusted to account for app bar
            child: SizedBox(
              width: 354,
              height: 65,
              child: Text(
                'Your Mental Health Matters',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),

          // Left Image (GIF)
          Positioned(
            left: 12,
            top: 165, // Adjusted to account for app bar
            child: Container(
              width: 183.4,
              height: 320.2,
              decoration: ShapeDecoration(
                color: const Color(0xFF0F0420), // Background color for the box
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Center(
                child: Image.asset(
                  "assets/gif.gif", // GIF on the left
                  width: 190, // Adjusted size to fit a portion of the box
                  height: 290, // Adjusted size to fit a portion of the box
                  fit: BoxFit.contain, // Ensures the GIF fits within the box
                ),
              ),
            ),
          ),

          // Text Below Left Image
          Positioned(
            left: 40,
            top: 420, // Adjusted position
            child: SizedBox(
              width: 230,
              height: 80,
              child: Text(
                'Need to Talk?\nI’m Here for You',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),

          // Right Top Card
          Positioned(
            right: 15,
            top: 165, // Adjusted to account for app bar
            child: Container(
              width: 140,
              height: 155,
              decoration: ShapeDecoration(
                color: const Color(0xFF0F0420),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat, // Friendly bot icon
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Let’s start chatting',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the "Chat Page"
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChatPage(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Right Bottom Card
          Positioned(
            right: 15,
            top: 330, // Adjusted to account for app bar
            child: Container(
              width: 140,
              height: 155,
              decoration: ShapeDecoration(
                color: const Color(0xFF0F0420), // Updated to match dark color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.air, // Breath icon
                          color: Colors.white,
                          size: 40,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Feeling breathless? \nTry these breathing exercises.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the "Breathing Exercises Page"
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  BreathingExercisesPage(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Cards
          Positioned(
            left: 20,
            bottom: 180,
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 72,
              decoration: ShapeDecoration(
                color: const Color(0xFF0F0420), // Updated to match dark color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Let’s work together to create a safe and healthy mindspace!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            left: 20,
            bottom: 95,
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 72,
              decoration: ShapeDecoration(
                color: const Color(0xFF0F0420), // Updated to match dark color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'How are you feeling today?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the "Feeling Page"
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FeelingPage(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            left: 20,
            bottom: 10,
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 72,
              decoration: ShapeDecoration(
                color: const Color(0xFF0F0420), // Updated to match dark color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "We're here to help you feel better, one step at a time.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Example Pages for Navigation

