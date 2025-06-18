import 'package:flutter/material.dart';

class SafetyChecklistPage extends StatelessWidget {
  const SafetyChecklistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'), // Background image
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Back arrow and "Safety Checklist" text
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Navigate back to the previous page
                    },
                  ),
                  const SizedBox(width: 10), // Spacer between arrow and text
                  const Text(
                    'Safety Checklist',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),

            // Checklist content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildChecklistItem(
                      title: '1. Protect Your Privacy',
                      description:
                      '• Avoid sharing personal information (like your address, phone number, or school) with strangers online.\n• Use strong, unique passwords for all your accounts and enable two-factor authentication.',
                    ),
                    const SizedBox(height: 20),
                    _buildChecklistItem(
                      title: '2. Think Before You Share',
                      description:
                      '• Be cautious when sharing photos, videos, or personal opinions online.\n• Remember, once something is posted, it can be difficult to completely erase it.',
                    ),
                    const SizedBox(height: 20),
                    _buildChecklistItem(
                      title: '3. Recognize and Avoid Scams',
                      description:
                      '• Be wary of unsolicited messages asking for personal or financial information.\n• Don’t click on suspicious links or download files from unknown sources.',
                    ),
                    const SizedBox(height: 20),
                    _buildChecklistItem(
                      title: '4. Block and Report Harassment',
                      description:
                      '• Use the app’s tools to block and report users who engage in bullying or harassment.\n• Don’t respond to hate messages—report them instead.',
                    ),
                    const SizedBox(height: 20),
                    _buildChecklistItem(
                      title: '5. Manage Your Mental Health',
                      description:
                      '• Take regular breaks from social media and online platforms to avoid burnout.\n• Engage with positive and supportive online communities.',
                    ),
                    const SizedBox(height: 20),
                    _buildChecklistItem(
                      title: '6. Keep Software Updated',
                      description:
                      '• Always update your apps and devices to ensure you have the latest security features.\n• Use antivirus software to protect against malware.',
                    ),
                    const SizedBox(height: 20),
                    _buildChecklistItem(
                      title: '7. Talk to Someone You Trust',
                      description:
                      '• If you experience harassment or feel unsafe, share your concerns with a parent, teacher, or trusted friend.\n• Remember, you’re not alone—help is always available.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build checklist items
  Widget _buildChecklistItem({required String title, required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}