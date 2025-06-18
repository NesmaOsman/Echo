import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const ReportingPage(),
    );
  }
}

class ReportingPage extends StatelessWidget {
  const ReportingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend the background behind the AppBar
      appBar: AppBar(
        title: const Text(
          'Reporting',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'), // Set background image
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + kToolbarHeight, // Account for AppBar height
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section 1: Report Cyberbullying
              const Text(
                'Report Cyberbullying',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'When ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: 'cyberbullying',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          const url = 'https://www.stopbullying.gov/cyberbullying/what-is-it';
                          if (await canLaunch(url)) {
                            await launch(url);
                          }
                        },
                    ),
                    const TextSpan(
                      text:
                      ' happens, it is important to document and report the behavior so it can be addressed.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Section 2: Steps to Take Immediately
              const Text(
                'Steps to Take Immediately',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: '• ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: 'Don’t respond to and don’t forward cyberbullying messages.\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: '• ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text:
                      'Keep evidence of cyberbullying. Record the dates, times, and descriptions of instances when cyberbullying has occurred. Save and print screenshots, emails, and text messages. Use this evidence to report cyberbullying to web and cell phone service providers and social media sites.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Section 3: Report Cyberbullying to Law Enforcement
              const Text(
                'Report Cyberbullying to Law Enforcement',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text:
                      'When cyberbullying involves these activities it is considered a crime and should be ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: 'reported to law enforcement',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          const url = 'https://www.stopbullying.gov/blog/2015/04/15/how-should-law-enforcement-respond-cyberbullying-incidents';
                          if (await canLaunch(url)) {
                            await launch(url);
                          }
                        },
                    ),
                    const TextSpan(
                      text: ':\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const TextSpan(
                      text:
                      '• Threats of violence\n• Child pornography or sending sexually explicit messages or photos\n• Taking a photo or video of someone in a place where he or she would expect privacy\n• Stalking and hate crimes\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const TextSpan(
                      text: 'Some states consider other forms of cyberbullying criminal. Consult your ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: 'state’s laws',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          const url = 'https://www.stopbullying.gov/resources/laws';
                          if (await canLaunch(url)) {
                            await launch(url);
                          }
                        },
                    ),
                    const TextSpan(
                      text: ' and ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: 'law enforcement',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          const url = 'https://www.stopbullying.gov/blog/2015/04/15/how-should-law-enforcement-respond-cyberbullying-incidents';
                          if (await canLaunch(url)) {
                            await launch(url);
                          }
                        },
                    ),
                    const TextSpan(
                      text: ' for additional guidance.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Section 4: Reporting Cyberbullying Cases
              const Text(
                'Reporting Cyberbullying Cases',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: '1. Gather Evidence\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text:
                      '• Record dates, times, and descriptions of instances when cyberbullying occurred\n• Save and print screenshots, emails, text messages, and other digital evidence\n• Keep a record of online activity, including relevant dates and times\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: '2. Report to Online Platforms\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text:
                      '• Most social media platforms and websites have reporting mechanisms for cyberbullying\n• Use these links to report cyberbullying, check privacy settings, and learn tips for staying safe online:\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text:
                      '• Facebook: www.facebook.com/help/contact/104400357125617\n• Twitter: help.twitter.com/en/safety\n• Instagram: help.instagram.com/155833387900271\n• YouTube: support.google.com/youtube/answer/2802163',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Section 5: Contact Law Enforcement
              const Text(
                '3. Contact Law Enforcement',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text:
                      '• If cyberbullying involves threats of violence, harassment, stalking, or hate crimes, report it to local law enforcement\n• Provide details of the incident, including dates, times, and platforms used\n• Officers may ask for screenshots and evidence of interactions\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Section 6: Inform School Authorities
              const Text(
                '4. Inform School Authorities (if applicable)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text:
                      '• If cyberbullying occurs at school or affects a school environment, report it to school counselors, teachers, or administrators\n• Keep parents informed throughout the process\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Section 7: Seek Support
              const Text(
                '5. Seek Support',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text:
                      '• If you’re experiencing cyberbullying or know someone who is, reach out to:\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text:
                      '• National Cybersecurity Alliance: www.staysafeonline.org\n• CyberB.A.A.P.: www.cybercrime.gov.in (for guidance and support)\n• StopBullying.gov: www.stopbullying.gov (for resources and information)\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: '• Remember\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text:
                      '• Keep a record of all interactions, including dates and times\n• Don’t delete any evidence',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Section 8: Conclusion
              const Text(
                'Report cyberbullying promptly to minimize harm and prevent further incidents\n',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Text(
                'By following these steps, you can effectively report cases of cyberbullying and work towards creating a safer online environment.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}