import 'package:flutter/material.dart';
import 'privacy_policy_page.dart'; // Import for PrivacyPolicyPage
import 'terms_of_service_page.dart'; // Import for TermsOfServicePage

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend background behind AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0, // No shadow
        title: const Text(
          "Account Settings",
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSettingOption(
                  "Privacy",
                  "• Clear Chat History:\n  Erase all previous conversations with the chatbot.",
                  "• Clear History",
                  Colors.red,
                  onPressed: () {
                    _showCustomDialog(context); // Show custom dialog
                  },
                ),
                _buildSettingOption(
                  "Privacy Policy",
                  "• Learn how we protect your data.",
                  "View Privacy Policy",
                  Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  PrivacyPolicyPage(),
                      ),
                    );
                  },
                ),
                _buildSettingOption(
                  "About the App",
                  "• Version Info:\n  • App Version: 1.0.0",
                  "",
                  Colors.white,
                  onPressed: () {
                    // Add action for About the App
                  },
                ),
                _buildSettingOption(
                  "Terms of Service",
                  "• Read the rules for using this app.",
                  "View Terms of Service",
                  Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TermsOfServicePage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingOption(
      String title,
      String description,
      String actionText,
      Color actionColor, {
        required VoidCallback onPressed,
      }) {
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
          if (actionText.isNotEmpty)
            TextButton(
              onPressed: onPressed,
              child: Text(
                actionText,
                style: TextStyle(
                  color: actionColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFF19053D), // Background color of the dialog
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Rounded corners
          ),
          child: Container(
            width: 305,
            height: 280,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Question Text
                const SizedBox(
                  width: 283,
                  height: 55,
                  child: Text(
                    'Are you sure you want to delete your history?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Spacer

                // Icons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: NetworkImage("https://placehold.co/30x30"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20), // Spacer
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: NetworkImage("https://placehold.co/30x30"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20), // Spacer

                // Yes and No Options
                _buildOption(context, "Yes", true),
                const SizedBox(height: 10), // Spacer
                _buildOption(context, "No", false),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildOption(BuildContext context, String text, bool isYes) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isSelected = false;

        return GestureDetector(
          onTap: () {
            setState(() {
              isSelected = true;
            });

            // Close the dialog and show a SnackBar if "Yes" is selected
            if (isYes) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("History deleted successfully!"),
                ),
              );
            } else {
              Navigator.of(context).pop(); // Close the dialog for "No"
            }
          },
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  color: isSelected ? Colors.white : Colors.transparent,
                ),
              ),
              const SizedBox(width: 10), // Spacer
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}