

import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class CustomNeumorphicCard extends StatelessWidget {
  final bool isHighlighted;
  final String? imagePath;

  CustomNeumorphicCard({
    super.key,
    this.isHighlighted = false,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    // Updated gradient colors (Dark Blue, Bluish, and Black)
    LinearGradient gradient = const LinearGradient(
      colors: [Color(0xFF34C8E8), Color(0xFF4E4AF2)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    LinearGradient backgroundGradient = LinearGradient(
      colors: [
        Color(0xFF1A2A3A).withOpacity(0.8), // Dark Blue
        Color(0xFF1E3C59).withOpacity(0.7), // Bluish Dark
        Colors.black.withOpacity(0.9), // Black
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.2, 0.6, 1.0],
    );

    double depth = 10; // Increase depth for a more pronounced 3D look

    return Neumorphic(
      style: NeumorphicStyle(
        depth: depth,
        color: isHighlighted ? Colors.transparent : const Color(0xFF2C3252),
        // Using transparent for gradient effect
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(18)),
        lightSource: LightSource.topLeft, // Simulate light coming from top left
        shadowLightColor: Colors.black.withOpacity(0.2), // Light shadow for depth
        intensity: 0.8, // Intensity of light for the bulging effect
      ),
      child: Container(
        height: 220,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: backgroundGradient, // Apply the updated linear gradient as background
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(8, 8),
              blurRadius: 15,
            ),
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              offset: Offset(-8, -8),
              blurRadius: 15,
            ),
          ], // Shadow to enhance the 3D effect
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            imagePath != null
                ? Center(
              child: Image.asset(imagePath ?? ''),
            )
                : const Center(
                child: Icon(Icons.bike_scooter,
                    size: 50, color: Colors.white)),
            const Text(
              "30% Off",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}