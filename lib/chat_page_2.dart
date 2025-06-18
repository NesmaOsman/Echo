import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

class ChatPage2 extends StatefulWidget {
  const ChatPage2({super.key});

  @override
  _ChatPage2State createState() => _ChatPage2State();
}

class _ChatPage2State extends State<ChatPage2> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  bool _awaitingHelpChoice = false;
  bool _inHelpFlow = false;

  @override
  void initState() {
    super.initState();
    _messages.add({
      'sender': 'bot',
      'text': "Hi there! I'm Echo, your safety assistant. How can I help you today?"
    });
  }

  void _sendMessage() async {
    if (_messageController.text.isNotEmpty && !_isLoading) {
      final userMessage = _messageController.text;
      setState(() {
        _isLoading = true;
        _messages.add({'sender': 'user', 'text': userMessage});
      });

      try {
        int prediction = await predictCyberbullying(userMessage);

        if (prediction == 1) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('⚠️ Potential harmful content detected'),
              backgroundColor: Colors.orange,
            ),
          );
          setState(() {
            _messages.add({
              'sender': 'bot',
              'text': "This message may contain harmful content.\nWould you like help?"
            });
            _awaitingHelpChoice = true;
            _inHelpFlow = true;
          });
        } else if (!_inHelpFlow) {
          setState(() {
            _messages.add({
              'sender': 'bot',
              'text': "This message appears safe. Let me know if you need anything."
            });
          });
        }
      } catch (e) {
        setState(() {
          _messages.add({
            'sender': 'bot',
            'text': "Sorry, I couldn't analyze that message. Please try again."
          });
        });
      } finally {
        setState(() {
          _isLoading = false;
          _messageController.clear();
          _scrollToBottom();
        });
      }
    }
  }

  void _handleUserMessage(String msg) {
    if (_awaitingHelpChoice) {
      _processHelpChoice(msg);
      return;
    }

    if (msg.toLowerCase().contains("help") ||
        msg.toLowerCase().contains("yes") ||
        msg.toLowerCase().contains("ok") ||
        msg.toLowerCase().contains("please")) {
      _showHelpOptions();
      return;
    }

    if (msg.contains("1") || msg.toLowerCase().contains("talk to someone")) {
      _showTalkToSomeone();
    }
    else if (msg.contains("2") || msg.toLowerCase().contains("emergency")) {
      _showEmergencySupport();
    }
    else if (msg.contains("3") || msg.toLowerCase().contains("report")) {
      _showReportingOptions();
    }
    else if (msg.contains("4") || msg.toLowerCase().contains("just talk")) {
      _showJustTalk();
    }
    else if (msg.contains("thank") || msg.contains("bye")) {
      _showClosingMessage();
      _inHelpFlow = false;
    }
    else if (msg.contains("hi") || msg.contains("hello")) {
      _showGreeting();
      _inHelpFlow = false;
    }
  }

  void _processHelpChoice(String choice) {
    setState(() {
      _awaitingHelpChoice = false;
      _inHelpFlow = true;

      if (choice.contains("1") || choice.toLowerCase().contains("talk to someone")) {
        _showTalkToSomeone();
      }
      else if (choice.contains("2") || choice.toLowerCase().contains("emergency")) {
        _showEmergencySupport();
      }
      else if (choice.contains("3") || choice.toLowerCase().contains("report")) {
        _showReportingOptions();
      }
      else if (choice.contains("4") || choice.toLowerCase().contains("just talk")) {
        _showJustTalk();
      }
      else {
        _messages.add({
          'sender': 'bot',
          'text': "Please choose an option:\n1. Talk to someone\n2. Emergency support\n3. Report\n4. Just talk"
        });
        _awaitingHelpChoice = true;
      }
    });
  }

  void _showHelpOptions() {
    setState(() {
      _messages.add({
        'sender': 'bot',
        'text': "Choose what you need help with:\n\n1. Talk to professional\n2. Emergency support\n3. Report incident\n4. Just talk"
      });
      _awaitingHelpChoice = true;
      _inHelpFlow = true;
    });
  }

  void _showTalkToSomeone() {
    setState(() {
      _messages.add({
        'sender': 'bot',
        'text': '''Professional support options:

National Mental Health Support (Egypt): Call [122](tel:122)
Available 24/7 for emotional support

Online Therapy:
- [BetterHelp](https://www.betterhelp.com)
- [TalkSpace](https://www.talkspace.com)

You're taking an important step by seeking help.'''
      });
    });
  }

  void _showEmergencySupport() {
    setState(() {
      _messages.add({
        'sender': 'bot',
        'text': '''Emergency contacts:

Immediate danger: 
- [911](tel:911) (US)
- [122](tel:122) (Egypt)

Suicide Prevention: 
- [1-800-273-8255](tel:18002738255) (US)

Your safety is most important. Please reach out now if you're in crisis.'''
      });
    });
  }

  void _showReportingOptions() {
    setState(() {
      _messages.add({
        'sender': 'bot',
        'text': '''To report harassment:

1. Save evidence (screenshots, messages)
2. Report to platform:
- [Facebook](https://www.facebook.com/help)
- [Twitter](https://help.twitter.com/safety)
- [Instagram](https://help.instagram.com/safety)
- [YouTube](https://support.google.com/youtube/safety)

3. For serious cases:
- Contact local police
- Visit [CyberCrime.gov.in](https://www.cybercrime.gov.in)'''
      });
    });
  }

  void _showJustTalk() {
    setState(() {
      _messages.add({
        'sender': 'bot',
        'text': "I'm here to listen. You can share anything you're comfortable with.\n\nIf you need specific help later, just say:\n- Help\n- Emergency\n- Report"
      });
    });
  }

  void _showClosingMessage() {
    setState(() {
      _messages.add({
        'sender': 'bot',
        'text': "You're always welcome here. Take care and remember I'm here if you need me."
      });
    });
  }

  void _showGreeting() {
    setState(() {
      _messages.add({
        'sender': 'bot',
        'text': "Hello! I can help with:\n- Message safety checks\n- Support resources\n- Reporting issues\n\nWhat do you need help with today?"
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/background.png",
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Column(
                        children: [
                          const Text(
                            'Echo Bot',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 8,
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
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/bot1.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final msg = _messages[index];
                        final isUser = msg['sender'] == 'user';

                        return Align(
                          alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF19053D),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: msg['sender'] == 'bot'
                                ? _parseMessageWithLinks(msg['text']!)
                                : Text(
                              msg['text']!,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF19053D),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            controller: _messageController,
                            decoration: const InputDecoration(
                              hintText: 'Ask me something . . .',
                              hintStyle: TextStyle(color: Colors.white54),
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(color: Colors.white),
                            onSubmitted: (value) {
                              _sendMessage();
                              _handleUserMessage(value.toLowerCase());
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF19053D),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: _isLoading
                              ? const CircularProgressIndicator(color: Colors.white)
                              : const Icon(Icons.send, color: Colors.white),
                          onPressed: () {
                            _sendMessage();
                            _handleUserMessage(_messageController.text.toLowerCase());
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _parseMessageWithLinks(String text) {
    final lines = text.split('\n');
    final spans = <TextSpan>[];

    final urlPattern = RegExp(r'\[(.*?)\]\((.*?)\)');

    for (var line in lines) {
      int start = 0;

      for (final match in urlPattern.allMatches(line)) {
        if (match.start > start) {
          spans.add(TextSpan(
            text: line.substring(start, match.start),
            style: const TextStyle(color: Colors.white),
          ));
        }

        final displayText = match.group(1)!;
        final link = match.group(2)!;

        spans.add(TextSpan(
          text: displayText,
          style: const TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () => _launchURL(link),
        ));

        start = match.end;
      }

      // Add remaining text after the last match
      if (start < line.length) {
        spans.add(TextSpan(
          text: line.substring(start),
          style: const TextStyle(color: Colors.white),
        ));
      }

      spans.add(const TextSpan(text: '\n')); // Preserve newlines
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }


  Future<int> predictCyberbullying(String text) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.118.61:5000/predict'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'text': text}),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        return jsonDecode(response.body)['prediction'];
      } else {
        print('Server error: ${response.statusCode} - ${response.body}');
        throw Exception('Server responded with status ${response.statusCode}');
      }
    } on TimeoutException {
      print('Request timed out');
      throw Exception('Request timed out. Please check your connection.');
    } on http.ClientException catch (e) {
      print('Client exception: $e');
      throw Exception('Failed to connect to the server. Is it running?');
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('An unexpected error occurred');
    }
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });;
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}