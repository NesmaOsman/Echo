import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import the provider package
import 'get_started_screen.dart'; // Import the Get Started screen
import 'user_provider.dart'; // Import the UserProvider
import 'home_page.dart'; // Import your HomePage

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()), // Provide UserProvider
      ],
      child: const FigmaToCodeApp(),
    ),
  );
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the red debug banner
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const GetStartedScreen(), // Start with the Get Started screen
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // Set HomePage as the initial route
    );
  }
}