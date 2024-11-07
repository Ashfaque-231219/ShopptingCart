import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final Gradient gradient;
  final Widget child; // Can accept Text, Icon, or Image
  final double? height; // Optional height
  final double? width; // Optional width
  final bool isHighlighted; // To toggle the highlight effect

  const CustomButton({
    super.key,
    required this.onTap,
    required this.gradient,
    required this.child,
    this.height, // Optional height
    this.width,  // Optional width
    this.isHighlighted = false, // Optional highlight
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Neumorphic(
        style: NeumorphicStyle(
          depth: isHighlighted ? 6 : 2, // Change depth for highlight
          color: Colors.transparent, // Make button background transparent to show gradient
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          lightSource: LightSource.topLeft, // Light comes from top left
          shadowLightColor: Colors.black.withOpacity(0.4), // Shadow for depth
          intensity: 0.8, // Intensity of the bulging effect
        ),
        child: Container(
          height: height ?? 50, // Default height if not provided
          width: width ?? 150,  // Default width if not provided
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            gradient: gradient, // Apply the gradient passed
            borderRadius: BorderRadius.circular(12), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(6, 6),
                blurRadius: 12,
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.6),
                offset: Offset(-6, -6),
                blurRadius: 12,
              ),
            ], // Shadow to enhance the 3D effect
          ),
          child: Center(child: child), // Center the child widget (Text, Icon, etc.)
        ),
      ),
    );
  }
}
