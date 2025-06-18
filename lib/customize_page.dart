import 'package:flutter/material.dart';

class CustomizePage extends StatelessWidget {
  const CustomizePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend the background behind the AppBar
      appBar: AppBar(
        title: const Text(
          'Customize',
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
        child: Column(
          children: [
            const SizedBox(height: 120), // Add padding to avoid overlap with the AppBar
            // Color Scheme Section
            ListTile(
              leading: const Icon(
                Icons.palette, // Icon for Color Scheme
                color: Colors.white,
                size: 30,
              ),
              title: const Text(
                'Color Scheme',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: const Text(
                'System (default)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w200,
                ),
              ),
              onTap: () {
                _showColorSchemePopup(context); // Show the pop-up
              },
            ),
            // Language Section
            ListTile(
              leading: const Icon(
                Icons.language, // Icon for Language
                color: Colors.white,
                size: 30,
              ),
              title: const Text(
                'Language',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: const Text(
                'English',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w200,
                ),
              ),
              onTap: () {
                _showLanguagePopup(context); // Show the pop-up
              },
            ),
          ],
        ),
      ),
    );
  }

  // Function to show the Color Scheme pop-up
  void _showColorSchemePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ColorSchemePopup();
      },
    );
  }

  // Function to show the Language pop-up
  void _showLanguagePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const LanguagePopup();
      },
    );
  }
}

// StatefulWidget to manage the selected color scheme
class ColorSchemePopup extends StatefulWidget {
  const ColorSchemePopup({super.key});

  @override
  State<ColorSchemePopup> createState() => _ColorSchemePopupState();
}

class _ColorSchemePopupState extends State<ColorSchemePopup> {
  String? _selectedOption; // Tracks the selected option

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF19053D), // Background color of the pop-up
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Color Scheme',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            _buildColorSchemeOption(
              title: 'System (Default)',
              isSelected: _selectedOption == 'System',
              onTap: () {
                setState(() {
                  _selectedOption = 'System'; // Update selected option
                });
              },
            ),
            const SizedBox(height: 16),
            _buildColorSchemeOption(
              title: 'Light',
              isSelected: _selectedOption == 'Light',
              onTap: () {
                setState(() {
                  _selectedOption = 'Light'; // Update selected option
                });
              },
            ),
            const SizedBox(height: 16),
            _buildColorSchemeOption(
              title: 'Dark',
              isSelected: _selectedOption == 'Dark',
              onTap: () {
                setState(() {
                  _selectedOption = 'Dark'; // Update selected option
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a color scheme option
  Widget _buildColorSchemeOption({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              color: isSelected ? Colors.white : Colors.transparent,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
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
  }
}

// StatefulWidget to manage the selected language
class LanguagePopup extends StatefulWidget {
  const LanguagePopup({super.key});

  @override
  State<LanguagePopup> createState() => _LanguagePopupState();
}

class _LanguagePopupState extends State<LanguagePopup> {
  String? _selectedLanguage; // Tracks the selected language

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF19053D), // Background color of the pop-up
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'App Language',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            _buildLanguageOption(
              title: 'English (Default)',
              isSelected: _selectedLanguage == 'English',
              onTap: () {
                setState(() {
                  _selectedLanguage = 'English'; // Update selected language
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a language option
  Widget _buildLanguageOption({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              color: isSelected ? Colors.white : Colors.transparent,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
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
  }
}