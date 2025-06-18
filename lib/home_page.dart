import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'settings_page.dart'; // Import the settings_page.dart file
import 'profile_page.dart'; // Import the profile_page.dart file
import 'package:provider/provider.dart'; // Import the provider package
import 'user_provider.dart'; // Import your UserProvider class
import 'chat_page_2.dart'; // Import the new ChatPage2
import 'safety_checklist_page.dart'; // Import the SafetyChecklistPage
import 'get_help_page.dart'; // Import the GetHelpPage
import 'feeling_overwhelmed_page.dart'; // Import the FeelingOverwhelmedPage

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double scaleWidth = screenWidth / 430; // Original width for Iphone
    double scaleHeight = screenHeight / 811; // Original height for Iphone

    // Access the UserProvider to get the username
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'), // Background image
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                // Gradient background with blur effect
                Positioned(
                  left: 26 * scaleWidth,
                  top: 120 * scaleHeight, // Adjusted position down
                  child: Container(
                    width: 378 * scaleWidth,
                    height: 189 * scaleHeight,
                    decoration: ShapeDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(-1.00, -0.00),
                        end: Alignment(1, 0),
                        colors: [
                          Color(0xFF12F3F4), // Blue color on the left
                          Color(0xFF8A19EB), // Purple on the right
                        ],
                        stops: [0.0, 1.0], // No middle color (pink removed)
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Reduced blur
                      child: const SizedBox(), // Use SizedBox to avoid unnecessary rendering
                    ),
                  ),
                ),

                // Bot image
                Positioned(
                  left: 0,
                  top: 130 * scaleHeight, // Adjusted position to match
                  child: SizedBox(
                    width: 182 * scaleWidth,
                    height: 146 * scaleHeight,
                    child: Image.asset(
                      'assets/bot2.png', // Bot image
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                // "Hey [Username]" text
                Positioned(
                  left: 160 * scaleWidth,
                  top: 128 * scaleHeight, // Adjusted text position
                  child: SizedBox(
                    width: 259 * scaleWidth,
                    height: 99 * scaleHeight,
                    child: Text(
                      'Hey ${userProvider.username}', // Dynamic username
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                // "let’s see what i can do for you?" text
                Positioned(
                  left: 165 * scaleWidth,
                  top: 202 * scaleHeight, // Adjusted position of second text
                  child: SizedBox(
                    width: 239 * scaleWidth,
                    height: 42 * scaleHeight,
                    child: const Text(
                      'let’s see what i can do for you?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                // Arrow pointing to the right (below the text)
                Positioned(
                  left: 325 * scaleWidth,
                  top: 240 * scaleHeight, // Positioned below the text
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 30, // Arrow size
                    ),
                    onPressed: () {
                      // Navigate to ChatPage2
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  ChatPage2(),
                        ),
                      );
                    },
                  ),
                ),

                // First rectangle (Chatting)
                Positioned(
                  left: 12 * scaleWidth,
                  top: 332 * scaleHeight, // Adjusted content inside rectangle
                  child: Container(
                    width: 130 * scaleWidth,
                    height: 160 * scaleHeight,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF19053D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.chat_bubble,
                          color: Colors.white,
                          size: 30,
                        ),
                        const SizedBox(height: 10), // Spacer
                        const Text(
                          'let’s start chatting',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10), // Spacer
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Hi! I’m here to help you navigate online challenges safely',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Second rectangle (Reporting)
                Positioned(
                  left: 150 * scaleWidth,
                  top: 332 * scaleHeight, // Adjusted content inside rectangle
                  child: Container(
                    width: 130 * scaleWidth,
                    height: 160 * scaleHeight,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF19053D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.report,
                          color: Colors.white,
                          size: 30,
                        ),
                        const SizedBox(height: 10), // Spacer
                        const Text(
                          'reporting',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10), // Spacer
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10 * scaleWidth),
                          child: const Text(
                            'A step-by-step guide on how to report',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Third rectangle (Mental Health)
                Positioned(
                  left: 288 * scaleWidth,
                  top: 332 * scaleHeight, // Adjusted content inside rectangle
                  child: Container(
                    width: 130 * scaleWidth,
                    height: 160 * scaleHeight,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF19053D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.health_and_safety,
                          color: Colors.white,
                          size: 30,
                        ),
                        const SizedBox(height: 10), // Spacer
                        const Text(
                          'Mental Health',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10), // Spacer
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10 * scaleWidth),
                          child: const Text(
                            'Coping Strategies, Mental Health Support, and more',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Rectangle 1: Safety Checklist
                Positioned(
                  left: 25 * scaleWidth,
                  top: 529 * scaleHeight,
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to SafetyChecklistPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  SafetyChecklistPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 371 * scaleWidth,
                      height: 72 * scaleHeight,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF19053D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20 * scaleWidth),
                            child: const Icon(
                              Icons.checklist,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10 * scaleWidth),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Safety Checklist',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'A step-by-step checklist for staying safe online',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20 * scaleWidth),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 24,
                              ),
                              onPressed: () {
                                // Navigate to SafetyChecklistPage
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>  SafetyChecklistPage(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Rectangle 2: Get Help
                Positioned(
                  left: 25 * scaleWidth,
                  top: 620 * scaleHeight,
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to GetHelpPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  GetHelpPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 371 * scaleWidth,
                      height: 72 * scaleHeight,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF19053D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20 * scaleWidth),
                            child: const Icon(
                              Icons.help_outline,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10 * scaleWidth),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Get Help',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'Links to external helplines or professional counseling support.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20 * scaleWidth),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 24,
                              ),
                              onPressed: () {
                                // Navigate to GetHelpPage
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>  GetHelpPage(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Rectangle 3: Feeling Overwhelmed?
                Positioned(
                  left: 25 * scaleWidth,
                  top: 710 * scaleHeight,
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to FeelingOverwhelmedPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  FeelingOverwhelmedPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 371 * scaleWidth,
                      height: 72 * scaleHeight,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF19053D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20 * scaleWidth),
                            child: const Icon(
                              Icons.sentiment_dissatisfied,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10 * scaleWidth),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Feeling Overwhelmed?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'Click to see 3 coping strategies.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20 * scaleWidth),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 24,
                              ),
                              onPressed: () {
                                // Navigate to FeelingOverwhelmedPage
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>  FeelingOverwhelmedPage(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Profile icon
                Positioned(
                  right: 20 * scaleWidth,
                  top: 40 * scaleHeight,
                  child: IconButton(
                    icon: const Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    },
                  ),
                ),

                // Hamburger menu icon
                Positioned(
                  left: 20 * scaleWidth,
                  top: 40 * scaleHeight,
                  child: IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  SettingsPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}