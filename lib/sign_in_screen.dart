import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart'; // For state management
import 'sign_up_screen.dart'; // Import the SignUpScreen
import 'home_page.dart'; // Import the HomePage
import 'user_provider.dart'; // Import the UserProvider

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: const Color(0xFF100425),
                image: const DecorationImage(
                  image: AssetImage('assets/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: screenWidth * 0.25,
                    top: screenHeight * 0.08 + 37.795,
                    child: SizedBox(
                      width: screenWidth * 0.5,
                      height: 48,
                      child: Text(
                        'sign in',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.62,
                    top: screenHeight * 0.46 + 37.795,
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.13,
                    top: screenHeight * 0.57 + 37.795,
                    child: GestureDetector(
                      onTap: () {
                        // Validate inputs
                        if (nameController.text.isEmpty ||
                            emailController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please fill in all fields."),
                            ),
                          );
                          return;
                        }

                        // Update UserProvider with login data
                        final userProvider = Provider.of<UserProvider>(context, listen: false);
                        userProvider.setUserData(
                          email: emailController.text,
                          username: nameController.text,
                          password: passwordController.text,
                          phone: "", // Add phone if needed
                          image: null, // Add image if needed
                        );

                        // Navigate to HomePage
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: Container(
                        width: screenWidth * 0.74,
                        height: 56,
                        decoration: ShapeDecoration(
                          color: Color(0xFF19053D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.25,
                    top: screenHeight * 0.69 + 37.795,
                    child: SizedBox(
                      width: screenWidth * 0.6,
                      height: 22,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'don’t have an account ? ',
                              style: TextStyle(
                                color: Color(0xFF19053D),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: 'sign up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SignUpScreen()),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.3,
                    top: screenHeight * 0.75 + 37.795,
                    child: SizedBox(
                      width: screenWidth * 0.4,
                      height: 17,
                      child: Text(
                        'sign in with',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF19053D),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.22,
                    top: screenHeight * 0.8 + 37.795,
                    child: Icon(
                      Icons.facebook,
                      color: Color(0xFF1A053E),
                      size: 40,
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.440,
                    top: screenHeight * 0.8 + 37.795,
                    child: Icon(
                      Icons.camera_alt,
                      color: Color(0xFF1A053E),
                      size: 40,
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.65,
                    top: screenHeight * 0.8 + 37.795,
                    child: SvgPicture.asset(
                      'assets/google_logo.svg',
                      color: Color(0xFF1A053E),
                      width: 45,
                      height: 45,
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.06,
                    top: screenHeight * 0.16 + 37.795,
                    child: SizedBox(
                      width: 100, // Adjusted width to fit "Name"
                      height: 27,
                      child: Text(
                        'Name',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.06,
                    top: screenHeight * 0.26 + 37.795,
                    child: SizedBox(
                      width: 100, // Adjusted width to fit "Email"
                      height: 27,
                      child: Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.06,
                    top: screenHeight * 0.36 + 37.795,
                    child: SizedBox(
                      width: 100, // Adjusted width to fit "Password"
                      height: 27,
                      child: Text(
                        'Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.06,
                    top: screenHeight * 0.2 + 37.795,
                    child: Container(
                      width: screenWidth * 0.88,
                      child: TextField(
                        controller: nameController,
                        focusNode: nameFocusNode,
                        style: TextStyle(
                          color: Colors.white, // Changed text color to white
                          fontSize: 17,
                          fontFamily: 'Inter',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.06,
                    top: screenHeight * 0.3 + 37.795,
                    child: Container(
                      width: screenWidth * 0.88,
                      child: TextField(
                        controller: emailController,
                        focusNode: emailFocusNode,
                        style: TextStyle(
                          color: Colors.white, // Changed text color to white
                          fontSize: 17,
                          fontFamily: 'Inter',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.06,
                    top: screenHeight * 0.4 + 37.795,
                    child: Container(
                      width: screenWidth * 0.88,
                      child: TextField(
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        obscureText: true,
                        style: TextStyle(
                          color: Colors.white, // Changed text color to white
                          fontSize: 17,
                          fontFamily: 'Inter',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.06,
                    top: screenHeight * 0.24 + 37.795,
                    child: Opacity(
                      opacity: 0.32,
                      child: Container(
                        width: screenWidth * 0.88,
                        height: 1,
                        decoration: BoxDecoration(
                          color: Color(0xFF1A053E),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.06,
                    top: screenHeight * 0.34 + 37.795,
                    child: Opacity(
                      opacity: 0.32,
                      child: Container(
                        width: screenWidth * 0.88,
                        height: 1,
                        decoration: BoxDecoration(
                          color: Color(0xFF1A053E),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.06,
                    top: screenHeight * 0.44 + 37.795,
                    child: Opacity(
                      opacity: 0.32,
                      child: Container(
                        width: screenWidth * 0.88,
                        height: 1,
                        decoration: BoxDecoration(
                          color: Color(0xFF1A053E),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}