import 'package:flutter/material.dart';

class FeelingOverwhelmedPage extends StatelessWidget {
  const FeelingOverwhelmedPage({super.key});

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
            // Back arrow and "Feeling Overwhelmed?" text
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
                    'Feeling Overwhelmed?',
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

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "It's okay to feel this way. Here are 3 coping strategies to help you manage stress and regain control:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 20),

                    _buildStrategy(
                      title: '1. Practice Mindfulness and Deep Breathing',
                      description:
                      'When everything feels like it\'s too much, take a pause. Close your eyes and focus on your breath. Inhale deeply for four seconds, hold for four seconds, and exhale slowly for four seconds. Repeat this until you start to feel calmer. This simple practice can help ground you and reduce feelings of anxiety.',
                    ),

                    const SizedBox(height: 20),
                    _buildStrategy(
                      title: '2. Break Down Tasks into Smaller Steps',
                      description:
                      'Overwhelm often comes from feeling like there’s too much to do. Try breaking down everything you need to do into smaller, more manageable pieces. Start with just one small step. Whether it\'s getting started with homework or talking to someone about how you feel, focusing on one thing at a time makes it easier to handle.',
                    ),

                    const SizedBox(height: 20),
                    _buildStrategy(
                      title: '3. Reach Out for Help',
                      description:
                      'You don\'t have to face overwhelming moments alone. Talking to someone you trust—whether it\'s a friend, family member, or counselor—can make a huge difference. Reaching out for support can help lighten the burden, offer perspective, and remind you that you’re not alone.',
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

  // Helper method to build strategy items
  Widget _buildStrategy({required String title, required String description}) {
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