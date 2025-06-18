import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import the provider package
import 'user_provider.dart'; // Import your UserProvider
import 'home_page.dart'; // Import your HomeScreen
import 'sign_in_screen.dart'; // Import your SignInScreen

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool hasSixCharacters = false;
  bool hasUppercase = false;
  bool hasThreeNumbers = false;
  bool hasSpecialCharacter = false;
  bool _isPasswordVisible = true; // Reverse the initial state
  bool _isConfirmPasswordVisible = true; // For Confirm Password visibility

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() => _validatePassword(_passwordController.text));
  }

  void _validatePassword(String password) {
    setState(() {
      hasSixCharacters = password.length >= 6;
      hasUppercase = password.contains(RegExp(r'[A-Z]'));
      hasThreeNumbers = RegExp(r'\d').allMatches(password).length >= 3;
      hasSpecialCharacter = password.contains(RegExp(r'[!@#\$&*~]'));
    });
  }

  Color _getBarColor(int index) {
    switch (index) {
      case 0:
        return hasSixCharacters ? const Color(0xFF1A053E) : Colors.white12;
      case 1:
        return hasUppercase ? const Color(0xFF1A053E) : Colors.white12;
      case 2:
        return hasThreeNumbers ? const Color(0xFF1A053E) : Colors.white12;
      case 3:
        return hasSpecialCharacter ? const Color(0xFF1A053E) : Colors.white12;
      default:
        return Colors.white12;
    }
  }

  void _signUp(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    // Validate password and confirm password
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    // Save user data to UserProvider
    userProvider.setUserData(
      email: _emailController.text,
      username: _nameController.text,
      password: _passwordController.text,
      phone: '', // You can add phone later if needed
      image: null, // Pass null for image (it's now nullable)
    );

    // Navigate to the home page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>  HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'First create your account',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 0),
                  TextField(
                    controller: _nameController, // Add controller for name
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 10),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xFF1A053E), width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xFF1A053E), width: 1),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 0),
                  TextField(
                    controller: _emailController, // Add controller for email
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 10),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xFF1A053E), width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xFF1A053E), width: 1),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 0),
                  TextField(
                    controller: _passwordController,
                    obscureText: _isPasswordVisible,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 10),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xFF1A053E), width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xFF1A053E), width: 1),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      4,
                          (index) => Container(
                        width: 50,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _getBarColor(index),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Password must include:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  PasswordRequirement(
                    text: 'At least 6 characters',
                    isMet: hasSixCharacters,
                  ),
                  PasswordRequirement(
                    text: '1 Uppercase letter',
                    isMet: hasUppercase,
                  ),
                  PasswordRequirement(
                    text: '3 Numeric characters',
                    isMet: hasThreeNumbers,
                  ),
                  PasswordRequirement(
                    text: '1 Special character',
                    isMet: hasSpecialCharacter,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Confirm Your Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 0),
                  TextField(
                    controller: _confirmPasswordController,
                    obscureText: _isConfirmPasswordVisible, // Handle confirm password visibility
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 10),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xFF1A053E), width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xFF1A053E), width: 1),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isConfirmPasswordVisible ? Icons.visibility_off : Icons.visibility,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF19053D),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => _signUp(context), // Call _signUp on button press
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigate back to the SignInScreen when the user presses "Login"
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const SignInScreen()),
                            );
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PasswordRequirement extends StatelessWidget {
  final String text;
  final bool isMet;

  const PasswordRequirement({required this.text, required this.isMet, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          size: 10,
          color: isMet ? const Color(0xFF1A053E) : Colors.white70,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            color: isMet ? const Color(0xFF1A053E) : Colors.white70,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}