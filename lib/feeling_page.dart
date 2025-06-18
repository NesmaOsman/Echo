import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // For local storage
import 'package:intl/intl.dart'; // For date formatting

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
      home: const FeelingPage(),
    );
  }
}

class FeelingPage extends StatefulWidget {
  const FeelingPage({super.key});

  @override
  State<FeelingPage> createState() => _FeelingPageState();
}

class _FeelingPageState extends State<FeelingPage> {
  String? _selectedFeeling; // Track the selected feeling
  String? _lastSelectedDate; // Track the last selection date

  @override
  void initState() {
    super.initState();
    _loadSelection(); // Load the saved selection when the page is opened
  }

  // Load the saved selection from local storage
  Future<void> _loadSelection() async {
    final prefs = await SharedPreferences.getInstance();
    final lastDate = prefs.getString('lastSelectedDate');
    final currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    // Reset selection if the date has changed
    if (lastDate != currentDate) {
      await prefs.remove('selectedFeeling');
      setState(() {
        _selectedFeeling = null;
      });
    } else {
      setState(() {
        _selectedFeeling = prefs.getString('selectedFeeling');
      });
    }
  }

  // Save the selected feeling to local storage
  Future<void> _saveSelection(String feeling) async {
    final prefs = await SharedPreferences.getInstance();
    final currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    await prefs.setString('selectedFeeling', feeling);
    await prefs.setString('lastSelectedDate', currentDate);

    setState(() {
      _selectedFeeling = feeling;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"), // Add your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Back arrow and title
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Navigate back
                    },
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'How are you feeling today?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // Scrollable list of feelings
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 20),
                children: [
                  _buildFeelingItem(context, Icons.sentiment_very_dissatisfied, "Disappointed"),
                  _buildFeelingItem(context, Icons.mood_bad, "Angry"),
                  _buildFeelingItem(context, Icons.sentiment_dissatisfied, "Sad"),
                  _buildFeelingItem(context, Icons.sentiment_neutral, "Normal"),
                  _buildFeelingItem(context, Icons.sentiment_dissatisfied, "Bored"),
                  _buildFeelingItem(context, Icons.sentiment_satisfied, "Satisfied"),
                  _buildFeelingItem(context, Icons.sentiment_very_satisfied, "Happy"),
                  _buildFeelingItem(context, Icons.whatshot, "Shocked"),
                  _buildFeelingItem(context, Icons.favorite, "Loving"),
                  _buildFeelingItem(context, Icons.emoji_emotions, "Excited"),
                  _buildFeelingItem(context, Icons.mood, "Grateful"),
                  _buildFeelingItem(context, Icons.sentiment_very_dissatisfied, "Frustrated"),
                  _buildFeelingItem(context, Icons.sentiment_dissatisfied, "Anxious"),
                  _buildFeelingItem(context, Icons.sentiment_neutral, "Calm"),
                  _buildFeelingItem(context, Icons.sentiment_satisfied, "Content"),
                  _buildFeelingItem(context, Icons.sentiment_very_satisfied, "Joyful"),
                  _buildFeelingItem(context, Icons.whatshot, "Surprised"),
                  _buildFeelingItem(context, Icons.favorite, "In Love"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a feeling item
  Widget _buildFeelingItem(BuildContext context, IconData icon, String feeling) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          // Icon
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(width: 10), // Space between icon and text

          // Feeling text
          SizedBox(
            width: 167,
            height: 25,
            child: Text(
              feeling,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          const SizedBox(width: 10), // Space between text and circle

          // Circle on the right
          GestureDetector(
            onTap: () {
              _saveSelection(feeling); // Save the selected feeling
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white, // White border
                  width: 2, // Border width
                ),
                color: _selectedFeeling == feeling
                    ? const Color(0xFF1A053E) // Selected color (center fill)
                    : Colors.transparent, // Transparent center if not selected
              ),
            ),
          ),
        ],
      ),
    );
  }
}