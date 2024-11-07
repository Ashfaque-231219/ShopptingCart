import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class BikeItemCard extends StatefulWidget {
  final String name;
  final String price;
  final String image;
  final String? discount;

  const BikeItemCard({
    required this.name,
    required this.price,
    required this.image,
    this.discount,
  });

  @override
  _BikeItemCardState createState() => _BikeItemCardState();
}

class _BikeItemCardState extends State<BikeItemCard> {
  bool _isLiked = false; // Track like status

  @override
  Widget build(BuildContext context) {
    LinearGradient backgroundGradient = LinearGradient(
      colors: [
        const Color(0xFF1A2A3A).withOpacity(0.8),
        Color(0xFF1E3C59).withOpacity(0.7),
        Colors.black.withOpacity(0.9),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.2, 0.6, 1.0],
    );

    double depth = 10;

    return Neumorphic(
      style: NeumorphicStyle(
        depth: depth,
        color: Colors.transparent,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(18)),
        lightSource: LightSource.topLeft,
        shadowLightColor: Colors.black.withOpacity(0.2),
        intensity: 0.8,
      ),
      child: Container(
        height: 220,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: backgroundGradient,
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
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5),
                          BlendMode.srcOver,
                        ),
                        child: Image.network(
                          widget.image,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isLiked = !_isLiked; // Toggle like status
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      color: Colors.transparent,
                      child: Icon(
                        Icons.favorite,
                        color: _isLiked ? Colors.blue : Colors.white, // Toggle color
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              widget.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.price,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
