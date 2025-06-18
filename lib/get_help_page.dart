import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package

class GetHelpPage extends StatelessWidget {
  const GetHelpPage({super.key});

  // Function to launch URLs
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

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
            // Back arrow and "Get Help" text
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
                    'Get Help',
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
                    _buildSection(
                      title: '1. Emergency Helpline',
                      description:
                      'If you are in immediate danger or need urgent help, contact your local emergency services.',
                      children: [
                        const SizedBox(height: 8),
                        _buildBulletPoint(
                          text: 'Call Now: Emergency number, e.g., 911 or 122 in Egypt.',
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    _buildSection(
                      title: '2. Mental Health Helplines',
                      description: '',
                      children: [
                        _buildBulletPoint(
                          text: 'Hotline 1:',
                        ),
                        _buildHelpline(
                          name: 'National Mental Health Support Line',
                          number: '123-456-7890',
                        ),
                        const SizedBox(height: 10),
                        _buildBulletPoint(
                          text: 'Hotline 2:',
                        ),
                        _buildHelpline(
                          name: 'Suicide Prevention Helpline',
                          number: '1-800-273-8255',
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    _buildSection(
                      title: '3. Professional Counseling Services',
                      description: '',
                      children: [
                        _buildBulletPoint(
                          text: 'Option 1:',
                        ),
                        _buildCounselingService(
                          name: 'BetterHelp Online Therapy',
                          link: 'https://www.betterhelp.com',
                        ),
                        const SizedBox(height: 10),
                        _buildBulletPoint(
                          text: 'Option 2:',
                        ),
                        _buildCounselingService(
                          name: 'TalkSpace: Therapy for All',
                          link: 'https://www.talkspace.com',
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    _buildSection(
                      title: '4. Chat with Our Bot',
                      description:
                      'Need someone to talk to right away? Use our chatbot for quick support and guidance.',
                      children: [
                        const SizedBox(height: 8),
                        _buildBulletPoint(
                          text: 'Start Chatting now',
                        ),
                      ],
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

  // Helper method to build sections
  Widget _buildSection({
    required String title,
    required String description,
    List<Widget> children = const [],
  }) {
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
        if (description.isNotEmpty)
          Text(
            description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w300,
            ),
          ),
        ...children,
      ],
    );
  }

  // Helper method to build bullet points
  Widget _buildBulletPoint({required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '• ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w300,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }

  // Helper method to build helpline items
  Widget _buildHelpline({required String name, required String number}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name: "$name"',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          'Number: $number',
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

  // Helper method to build counseling service items
  Widget _buildCounselingService({required String name, required String link}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name: "$name"',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w300,
          ),
        ),
        GestureDetector(
          onTap: () => _launchURL(link),
          child: Text(
            'Link: $link',
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w300,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}