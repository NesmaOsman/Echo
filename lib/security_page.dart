import 'package:flutter/material.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend background behind AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0, // No shadow
        title: const Text(
          "Security",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          // Full-Screen Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/background.png",
              fit: BoxFit.cover,
            ),
          ),
          // Content starts below AppBar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, kToolbarHeight + 70, 16, 0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Introductory Line
                  const Text(
                    "At Echo, we take security seriously to ensure your data and privacy are protected. Here’s how we manage security:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20), // Spacer
                  // Security Measures Text
                  _buildSecuritySection(
                    "Secure Authentication",
                    "We use strong password requirements and encryption to protect your account. Passwords are securely hashed and never stored in plain text.",
                  ),
                  _buildSecuritySection(
                    "Privacy Protection",
                    "We collect only the necessary data required to provide our services. Your data is never shared with third parties without your consent.",
                  ),
                  _buildSecuritySection(
                    "Regular Updates",
                    "We continuously update the app to address potential vulnerabilities and improve security. Our team monitors for emerging threats and acts promptly to mitigate risks.",
                  ),
                  _buildSecuritySection(
                    "User Control",
                    "You have full control over your account settings, including privacy preferences and data management. You can easily manage connected devices and review account activity.",
                  ),
                  _buildSecuritySection(
                    "Transparency",
                    "We provide clear and accessible privacy policies to explain how your data is handled. If you have questions or concerns, our support team is here to help.",
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Our Commitment",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Your trust is our priority. We are dedicated to maintaining a secure environment where you can use Echo with confidence. If you ever notice anything unusual, please contact us immediately so we can assist you.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
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

  Widget _buildSecuritySection(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}