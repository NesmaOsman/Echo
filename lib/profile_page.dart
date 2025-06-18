import 'dart:io'; // For File class
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For image picking
import 'package:provider/provider.dart'; // For state management
import 'user_provider.dart'; // Update this path
import 'settings_page.dart'; // Import for SettingsPage
import 'personal_data_page.dart';
import 'help_center_page.dart';
import 'sign_in_screen.dart'; // Import your login or welcome page

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final Color primaryColor = const Color(0xFF8E22D2); // Updated color

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend the background behind the app bar
      backgroundColor: Colors.transparent, // Make scaffold background transparent
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent app bar
        elevation: 0, // Remove app bar shadow
        centerTitle: true,
        title: const Text(
          "Profile Settings",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Save functionality
            },
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 140), // Add padding to avoid overlap with the app bar
              // Profile Image & Name
              Center(
                child: Stack(
                  children: [
                    userProvider.image != null
                        ? CircleAvatar(
                      radius: 60,
                      backgroundImage: FileImage(userProvider.image!),
                    )
                        : const CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 50, color: Colors.grey),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => _pickImage(userProvider),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                userProvider.username,
                style: const TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                userProvider.email,
                style: const TextStyle(color: Colors.grey, fontSize: 18),
              ),
              const SizedBox(height: 30),

              // Profile Options
              settingsOption(
                Icons.person,
                "Personal Data",
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonalDataPage(),
                    ),
                  );
                },
              ),
              settingsOption(
                Icons.settings,
                "Settings",
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  SettingsPage(),
                    ),
                  );
                },
              ),
              settingsOption(
                Icons.help_outline,
                "Help Center",
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  HelpCenterPage(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              // Sign Out Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _logout(context); // Call the logout function
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  label: const Text(
                    "Sign Out",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  icon: const Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build profile options
  Widget settingsOption(IconData icon, String title, void Function() onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
      onTap: onTap,
    );
  }

  // Function to pick an image from the gallery or camera
  Future<void> _pickImage(UserProvider userProvider) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      userProvider.setImage(File(pickedFile.path));
    }
  }

  // Function to handle logout
  void _logout(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    // Clear user data (e.g., reset UserProvider)
    userProvider.setUserData(
      email: "",
      username: "",
      password: "",
      phone: "",
      image: null,
    );

    // Navigate to the login or welcome page
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const SignInScreen(), // Replace with your login or welcome page
      ),
          (route) => false, // Remove all previous routes
    );
  }
}