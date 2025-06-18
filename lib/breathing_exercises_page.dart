import 'dart:async';
import 'package:flutter/material.dart';

class BreathingExercisesPage extends StatelessWidget {
  const BreathingExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image or color
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF100425), // Fallback background color
              image: DecorationImage(
                image: AssetImage("assets/gif.gif"),                fit: BoxFit.cover,
              ),
            ),
          ),

          // Breathing exercise overlay
          const BreathingExercise(),
        ],
      ),
    );
  }
}

class BreathingExercise extends StatefulWidget {
  const BreathingExercise({super.key});

  @override
  _BreathingExerciseState createState() => _BreathingExerciseState();
}

class _BreathingExerciseState extends State<BreathingExercise> {
  int inhaleTime = 4; // Time for inhale in seconds
  int holdTime = 7; // Time for hold in seconds
  int exhaleTime = 8; // Time for exhale in seconds
  String currentStage = 'Inhale'; // Current stage of the breathing exercise
  late Timer _timer; // Timer for the breathing exercise

  @override
  void initState() {
    super.initState();
    _startExercise(); // Start the breathing exercise timer
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  // Start the breathing exercise timer
  void _startExercise() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (currentStage == 'Inhale') {
          if (inhaleTime > 0) {
            inhaleTime--;
          } else {
            currentStage = 'Hold';
            inhaleTime = 4; // Reset inhale time
          }
        } else if (currentStage == 'Hold') {
          if (holdTime > 0) {
            holdTime--;
          } else {
            currentStage = 'Exhale';
            holdTime = 7; // Reset hold time
          }
        } else if (currentStage == 'Exhale') {
          if (exhaleTime > 0) {
            exhaleTime--;
          } else {
            currentStage = 'Inhale';
            exhaleTime = 8; // Reset exhale time
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display the current stage (Inhale, Hold, Exhale)
          Text(
            currentStage,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20), // Spacer

          // Display the countdown timer for the current stage
          Text(
            currentStage == 'Inhale'
                ? '$inhaleTime'
                : currentStage == 'Hold'
                ? '$holdTime'
                : '$exhaleTime',
            style: const TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}