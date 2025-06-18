import 'package:flutter/material.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // This removes the red debug banner
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const Scaffold(
        body: SafeArea(
          child: ChatPage(),
        ),
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = [];

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add(_messageController.text); // Add the message to the list
        _messageController.clear(); // Clear the input field
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.png"),
          fit: BoxFit.cover, // Ensures the background covers the entire screen
        ),
      ),
      child: Stack(
        children: [
          // Back Button
          Positioned(
            left: width * 0.05,
            top: height * 0.05,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous page
              },
            ),
          ),

          // Bot name
          Positioned(
            left: width * 0.4,
            top: height * 0.08,
            child: SizedBox(
              width: width * 0.35,
              height: height * 0.04,
              child: const Text(
                'Echo Bot',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis, // Handle overflow
              ),
            ),
          ),

          // Online status
          Positioned(
            left: width * 0.43,
            top: height * 0.12,
            child: Row(
              children: [
                Container(
                  width: 8, // Green circle size
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 5),
                const Text(
                  'Online',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          // Bot profile picture
          Positioned(
            left: width * 0.75,
            top: height * 0.06,
            child: Container(
              width: width * 0.15,
              height: height * 0.08,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bot1.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),

          // Chat Messages
          Positioned(
            left: width * 0.06,
            top: height * 0.20,
            right: width * 0.06,
            bottom: height * 0.15,
            child: ListView.builder(
              itemCount: _messages.length + 1, // +1 for the bot's initial message
              itemBuilder: (context, index) {
                if (index == 0) {
                  // Bot's initial message
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF19053D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'HI there! I’m Echo. How can I help you today?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                } else {
                  // User's messages
                  return Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF19053D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        _messages[index - 1],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),

          // Text input box
          Positioned(
            left: width * 0.06,
            top: height * 0.92,
            child: Material(
              color: Colors.transparent, // Ensure Material is transparent
              child: Container(
                width: width * 0.75,
                height: height * 0.06,
                decoration: ShapeDecoration(
                  color: const Color(0xFF19053D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Ask me something . . .',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w200,
                      ),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                    onSubmitted: (value) {
                      _sendMessage(); // Send message on pressing Enter
                    },
                  ),
                ),
              ),
            ),
          ),

          // Send button
          Positioned(
            left: width * 0.85,
            top: height * 0.92,
            child: Container(
              width: width * 0.1,
              height: height * 0.05,
              decoration: ShapeDecoration(
                color: const Color(0xFF19053D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 24, // Icon size
                ),
                onPressed: _sendMessage, // Send message on button press
              ),
            ),
          ),
        ],
      ),
    );
  }
}