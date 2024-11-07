import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1F38),
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Neumorphic(
              style: const NeumorphicStyle(
                shape: NeumorphicShape.flat,
                depth: 4,
                color: Color(0xFF2C3252),
                boxShape: NeumorphicBoxShape.circle(),
              ),
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile_pic.png'), // Replace with actual profile image asset
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "John Doe",
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              "johndoe@example.com",
              style: TextStyle(color: Colors.grey[400], fontSize: 16),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                children: [
                  ProfileMenuItem(icon: Icons.logout, title: "Logout", onTap: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: onTap,
      style: NeumorphicStyle(
        color: const Color(0xFF2C3252),
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(16)),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
        ],
      ),
    );
  }
}
