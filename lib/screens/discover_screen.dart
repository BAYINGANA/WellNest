import 'package:flutter/material.dart';
import 'package:wellnest/screens/call_screen.dart';
import 'package:wellnest/widgets/navigation_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart'; // For playing YouTube videos
import 'package:audioplayers/audioplayers.dart'; // For playing sounds

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Replace the Header widget with the custom header
      appBar: AppBar(
        backgroundColor: Colors.white, // Match the background color
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), // Back arrow
          onPressed: () => Navigator.pop(context),
        ),
        title: Center(
          child: Text(
            'WellNest',
            style: TextStyle(
              color: const Color(0xFF242364),
              fontSize: 32,
              fontWeight: FontWeight.bold,
              fontFamily: 'Bitter',
              shadows: [
                Shadow(
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.25),
                ),
              ],
            ),
          ),
        ),
        actions: const [
          SizedBox(width: 48), // Spacer to balance the row
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 390),
            margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 40), // Add spacing below the header
                ImmediateHelpButton(),
                SizedBox(height: 30),
                MeditationSection(), // Focused on meditation and stress relief
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        selectedIndex: 0,
      ),
    );
  }
}

/// Immediate Help Button Section
class ImmediateHelpButton extends StatelessWidget {
  const ImmediateHelpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Are you or anybody near you facing any issue',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Bitter',
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFA1EEBD), // Updated to 0xFFA1EEBD
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            minimumSize: const Size(289, 50),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CallScreen(),
              ),
            );
          },
          child: const Text(
            'Need immediate help!',
            style: TextStyle(
              color: Colors.white, // White text for contrast
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Bitter',
            ),
          ),
        ),
      ],
    );
  }
}

/// Guided Meditation & Stress Relief Section
class MeditationSection extends StatelessWidget {
  const MeditationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Guided Meditation & Stress Relief',
          style: TextStyle(
            color: Color(0xFFA1EEBD), // Updated to 0xFFA1EEBD
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Bitter',
          ),
        ),
        const SizedBox(height: 20),
        MeditationCard(
          icon: Icons.self_improvement,
          title: '5-Minute Breathing Exercise',
          onTap: () => _navigateToMeditationDetail(context, '5-Minute Breathing Exercise'),
        ),
        const SizedBox(height: 20),
        MeditationCard(
          icon: Icons.mediation,
          title: '10-Minute Guided Meditation',
          onTap: () => _navigateToMeditationDetail(context, '10-Minute Guided Meditation'),
        ),
        const SizedBox(height: 20),
        MeditationCard(
          icon: Icons.music_note,
          title: 'Relaxing Music for Stress Relief',
          onTap: () => _navigateToMeditationDetail(context, 'Relaxing Music for Stress Relief'),
        ),
      ],
    );
  }

  void _navigateToMeditationDetail(BuildContext context, String title) {
    // Navigate to a detailed screen for the selected meditation exercise
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MeditationDetailScreen(title: title),
      ),
    );
  }
}

/// Meditation Detail Screen
class MeditationDetailScreen extends StatefulWidget {
  final String title;

  const MeditationDetailScreen({super.key, required this.title});

  @override
  State<MeditationDetailScreen> createState() => _MeditationDetailScreenState();
}

class _MeditationDetailScreenState extends State<MeditationDetailScreen> {
  late YoutubePlayerController _youtubeController;
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  int _timeLeft = 300; // 5 minutes in seconds
  bool _isTimerRunning = false;
  int _meditationCounter = 0; // Counter for meditation screen

  @override
  void initState() {
    super.initState();
    if (widget.title == '10-Minute Guided Meditation') {
      _youtubeController = YoutubePlayerController(
        initialVideoId: 'inpok4MKVLM', // Replace with your video ID
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
    }
  }

  @override
  void dispose() {
    if (widget.title == '10-Minute Guided Meditation') {
      _youtubeController.dispose();
    }
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color(0xFFA1EEBD), // Updated to 0xFFA1EEBD
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.title == '5-Minute Breathing Exercise')
              _buildBreathingExercise(context),
            if (widget.title == '10-Minute Guided Meditation')
              _buildGuidedMeditation(context),
            if (widget.title == 'Relaxing Music for Stress Relief')
              _buildRelaxingMusic(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBreathingExercise(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.self_improvement,
          size: 100,
          color: Color(0xFFA1EEBD), // Updated to 0xFFA1EEBD
        ),
        const SizedBox(height: 20),
        const Text(
          'Follow the breathing pattern:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        const Text(
          'Inhale for 4 seconds, hold for 4 seconds, exhale for 6 seconds.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        Text(
          'Time left: $_timeLeft seconds',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _isTimerRunning ? null : _startTimer,
          child: Text(_isTimerRunning ? 'Running...' : 'Start Timer'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _stopTimer,
          child: const Text('Stop Timer'),
        ),
      ],
    );
  }

  Widget _buildGuidedMeditation(BuildContext context) {
    return Column(
      children: [
        YoutubePlayer(
          controller: _youtubeController,
          showVideoProgressIndicator: true,
          progressIndicatorColor: const Color(0xFFA1EEBD), // Updated to 0xFFA1EEBD
        ),
        const SizedBox(height: 20),
        Text(
          'Meditation Counter: $_meditationCounter',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _isPlaying = !_isPlaying;
              if (_isPlaying) {
                _youtubeController.play();
                _meditationCounter++;
              } else {
                _youtubeController.pause();
              }
            });
          },
          child: Text(_isPlaying ? 'Pause' : 'Play'),
        ),
      ],
    );
  }

  Widget _buildRelaxingMusic(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.music_note,
          size: 100,
          color: Color(0xFFA1EEBD), // Updated to 0xFFA1EEBD
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => _playSound('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'),
          child: const Text('Play Rain Sounds'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => _playSound('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3'),
          child: const Text('Play Ocean Waves'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => _playSound('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3'),
          child: const Text('Play Forest Sounds'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _audioPlayer.stop,
          child: const Text('Stop Sounds'),
        ),
      ],
    );
  }

  void _startTimer() {
    setState(() {
      _isTimerRunning = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (_timeLeft > 0 && _isTimerRunning) {
        setState(() {
          _timeLeft--;
        });
        _startTimer();
      } else {
        setState(() {
          _isTimerRunning = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Breathing exercise completed!')),
        );
      }
    });
  }

  void _stopTimer() {
    setState(() {
      _isTimerRunning = false;
      _timeLeft = 300; // Reset timer
    });
  }

  void _playSound(String soundUrl) async {
    try {
      await _audioPlayer.play(UrlSource(soundUrl));
      print('Playing sound: $soundUrl');
    } catch (e) {
      print('Error playing sound: $e');
    }
  }
}

/// Meditation Card Widget
class MeditationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const MeditationCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: const Color(0xFFA1EEBD)), // Updated to 0xFFA1EEBD
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF121417),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Bitter',
              ),
            ),
          ],
        ),
      ),
    );
  }
}