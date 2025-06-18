import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend background behind AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0, // No shadow
        title: const Text(
          "Terms and Conditions",
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
                  _buildSection(
                    "1. Introduction",
                    "Welcome to Echo! These Terms and Conditions govern your use of the Echo app and services. By accessing or using Echo, you agree to comply with these terms. If you do not agree with any part of these terms, please refrain from using our services.",
                  ),
                  _buildSection(
                    "2. Eligibility",
                    "You must be at least 13 years old to use Echo. If you are under 18, you confirm that you have obtained parental or guardian consent to use Echo. You are responsible for ensuring that your use of Echo complies with all applicable laws and regulations.",
                  ),
                  _buildSection(
                    "3. User Responsibilities",
                    "You agree to use Echo only for lawful purposes. You are responsible for maintaining the confidentiality of your account credentials. You must not engage in any activity that disrupts or interferes with the functioning of Echo.",
                  ),
                  _buildSection(
                    "4. Intellectual Property",
                    "All content, features, and functionality within Echo (including but not limited to text, graphics, logos, and software) are the property of Echo or its licensors. You may not reproduce, distribute, or create derivative works without prior written consent from Echo.",
                  ),
                  _buildSection(
                    "5. Privacy",
                    "Your use of Echo is subject to our Privacy Policy, which explains how we collect, use, and protect your personal information. By using Echo, you consent to the practices described in the Privacy Policy.",
                  ),
                  _buildSection(
                    "6. Prohibited Activities",
                    "You agree not to use Echo for any illegal or unauthorized purpose, harass, abuse, or harm other users, attempt to gain unauthorized access to Echo’s systems or networks, or upload or share content that is offensive, defamatory, or violates the rights of others.",
                  ),
                  _buildSection(
                    "7. Termination",
                    "Echo reserves the right to suspend or terminate your access to the app at any time, with or without notice, for violations of these terms or for any other reason. You may also terminate your account at any time by contacting our support team.",
                  ),
                  _buildSection(
                    "8. Limitation of Liability",
                    "Echo is provided \"as is\" without any warranties, express or implied. Echo shall not be liable for any indirect, incidental, or consequential damages arising from your use of the app.",
                  ),
                  _buildSection(
                    "9. Changes to Terms",
                    "Echo reserves the right to modify these Terms and Conditions at any time. Continued use of the app after changes constitutes your acceptance of the updated terms.",
                  ),
                  _buildSection(
                    "10. Governing Law",
                    "These Terms and Conditions are governed by and construed in accordance with the laws of [Your Country/Region]. Any disputes arising from these terms shall be resolved in the courts of [Your Country/Region].",
                  ),
                  _buildSection(
                    "11. Contact Us",
                    "If you have any questions or concerns about these Terms and Conditions, please contact us at:\n\nEmail: support@echoapp.com",
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Acknowledgment",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "By using Echo, you acknowledge that you have read, understood, and agreed to these Terms and Conditions.",
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

  Widget _buildSection(String title, String content) {
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
            content,
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