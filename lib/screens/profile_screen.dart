import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnest/screens/login_screen.dart'; // Assuming you have a login screen
import 'package:wellnest/widgets/navigation_bar.dart'; // Custom navigation bar

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Mock user data (replace with actual user data from your app state)
  final Map<String, String> user = {
    'name': 'John Doe',
    'email': 'johndoe@example.com',
    'bio': 'I love using WellNest to take care of my mental health! 💚',
    'imageUrl': 'https://via.placeholder.com/150', // Placeholder image
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              _buildHeader(),
              _buildProfileInfo(),
              _buildOptions(),
              _buildFooter(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        selectedIndex: 4, // Profile screen is index 4
      ),
    );
  }

  /// Top wavy shape + "Profile" text
  Widget _buildHeader() {
    return Stack(
      children: [
        // Top wavy shape
        ClipPath(
          clipper: TopCircularClipper(),
          child: Container(
            height: 220,
            width: double.infinity,
            color: ThemeConstants.lightBlue.withValues(alpha: 0.7),
            child: ClipPath(
              clipper: TopCircularClipper(),
              child: Container(
                color: ThemeConstants.lighterBlue,
              ),
            ),
          ),
        ),
        // "Profile" text
        Positioned(
          left: 30,
          bottom: 30,
          child: Text(
            'Profile',
            style: ThemeConstants.titleStyle,
          ),
        ),
      ],
    );
  }

  /// User profile information (name, email, bio, and profile picture)
  Widget _buildProfileInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        children: [
          // Profile Picture
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(user['imageUrl']!),
            backgroundColor: ThemeConstants.primaryPurple,
            child: user['imageUrl']!.isEmpty
                ? Icon(
              Icons.person,
              size: 60,
              color: Colors.white,
            )
                : null,
          ),
          const SizedBox(height: 16),
          // Name
          Text(
            user['name']!,
            style: GoogleFonts.inriaSans(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: ThemeConstants.darkBlue,
            ),
          ),
          const SizedBox(height: 8),
          // Email
          Text(
            user['email']!,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          // Bio
          Text(
            user['bio']!,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }

  /// Profile options (Settings, Edit Profile, Privacy Policy, Logout, etc.)
  Widget _buildOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        children: [
          _buildOptionTile(
            icon: Icons.settings,
            title: 'Settings',
            onTap: () {
              // Navigate to Settings screen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings clicked!')),
              );
            },
          ),
          const Divider(height: 20, thickness: 1),
          _buildOptionTile(
            icon: Icons.edit,
            title: 'Edit Profile',
            onTap: () {
              // Navigate to Edit Profile screen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Edit Profile clicked!')),
              );
            },
          ),
          const Divider(height: 20, thickness: 1),
          _buildOptionTile(
            icon: Icons.privacy_tip,
            title: 'Privacy Policy',
            onTap: () {
              // Navigate to Privacy Policy screen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Privacy Policy clicked!')),
              );
            },
          ),
          const Divider(height: 20, thickness: 1),
          _buildOptionTile(
            icon: Icons.help,
            title: 'Help & Support',
            onTap: () {
              // Navigate to Help & Support screen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Help & Support clicked!')),
              );
            },
          ),
          const Divider(height: 20, thickness: 1),
          _buildOptionTile(
            icon: Icons.logout,
            title: 'Logout',
            onTap: () {
              // Logout and navigate to Login screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  /// Reusable option tile widget
  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: ThemeConstants.primaryPurple,
      ),
      title: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }

  /// Bottom wavy shape (optional)
  Widget _buildFooter() {
    return Stack(
      children: [
        ClipPath(
          clipper: BottomCircularClipper(),
          child: Container(
            height: 160,
            width: double.infinity,
            color: ThemeConstants.lightBlue.withValues(alpha: 0.7),
            child: ClipPath(
              clipper: BottomCircularClipper(),
              child: Container(
                color: ThemeConstants.lighterBlue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Clipper for the top wavy shape
class TopCircularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.8);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height * 0.8,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Clipper for the bottom wavy shape
class BottomCircularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.2);
    path.quadraticBezierTo(
      size.width / 2,
      0,
      size.width,
      size.height * 0.2,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Centralized theme/colors/text styles
class ThemeConstants {
  static const Color primaryPurple = Color(0xFF7472E0);
  static const Color darkBlue = Color(0xFF242364);
  static const Color lightGreen = Color(0xFFA1EEBD);
  static const Color lightBlue = Color(0xFFF0F8FF);
  static const Color lighterBlue = Color(0xFFE6F3FF);

  static TextStyle get titleStyle => GoogleFonts.inriaSans(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: darkBlue,
  );
}