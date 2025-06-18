import 'package:flutter/material.dart';
import 'mental_health_page.dart'; // Import for MentalHealthPage
import 'reporting_page.dart'; // Import for ReportingPage
import 'customize_page.dart'; // Import for CustomizePage
import 'profile_page.dart'; // Import for ProfilePage
import 'change_password_page.dart'; // Import for ChangePasswordPage
import 'delete_account_page.dart'; // Import for DeleteAccountPage
import 'account_settings.dart'; // Import for AccountSettingsPage
import 'privacy_policy_page.dart'; // Import for PrivacyPolicyPage
import 'security_page.dart'; // Import for SecurityPage
import 'terms_and_conditions_page.dart'; // Import for TermsAndConditionsPage

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Ensures content extends behind the app bar
      body: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Scrollable Content with Persistent AppBar
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true, // Keeps app bar visible while scrolling
                floating: false, // Ensures app bar doesn't disappear
                expandedHeight: 120, // Gives a nice effect when scrolling
                backgroundColor: Colors.transparent, // Transparent app bar
                elevation: 0, // Removes app bar shadow
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.8), // Matches background
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        "Settings",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      sectionTitle("Account"),
                      settingsOption(
                        Icons.person, // Icon for Edit Profile
                        "Edit Profile",
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfilePage(),
                            ),
                          );
                        },
                      ),
                      settingsOption(
                        Icons.lock, // Icon for Change Password
                        "Change Password",
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  ChangePasswordPage(),
                            ),
                          );
                        },
                      ),
                      settingsOption(
                        Icons.settings, // Icon for Account Settings
                        "Account Settings",
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  AccountSettingsPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),

                      sectionTitle("App Settings"),
                      settingsOption(
                        Icons.palette, // Icon for Customize
                        "Customize",
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  CustomizePage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),

                      sectionTitle("Privacy & Security"),
                      settingsOption(
                        Icons.security, // Icon for Privacy Settings
                        "Privacy Settings",
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  PrivacyPolicyPage(),
                            ),
                          );
                        },
                      ),
                      settingsOption(
                        Icons.lock_outline, // Icon for Security
                        "Security",
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  SecurityPage(),
                            ),
                          );
                        },
                      ),
                      settingsOption(
                        Icons.delete, // Icon for Delete Account
                        "Delete Account",
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  DeleteAccountPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),

                      sectionTitle("Help & Support"),
                      settingsOption(
                        Icons.health_and_safety, // Icon for Mental Health
                        "Mental Health",
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MentalHealthPage(),
                            ),
                          );
                        },
                      ),
                      settingsOption(
                        Icons.report, // Icon for Reporting
                        "Reporting",
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  ReportingPage(),
                            ),
                          );
                        },
                      ),
                      settingsOption(
                        Icons.description, // Icon for Terms & Conditions
                        "Terms & Conditions",
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  TermsAndConditionsPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Section Title Widget
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Settings Option Widget
  Widget settingsOption(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
      onTap: onTap,
    );
  }
}
