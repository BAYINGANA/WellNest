import 'package:flutter/material.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      constraints: const BoxConstraints(maxWidth: 480),
      child: Column(
        children: [
          // Aspect ratio for the main call area
          AspectRatio(
            aspectRatio: 1 / 0.462,
            child: Stack(
              children: [
                // Background image (clickable if you like)
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () {
                      // TODO: Handle background tap
                    },
                    child: Image.network(
                      'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/a19f956ebe39760f5e3ce43abcbad665519164346707810e23110c9aa9a91c1b?apiKey=f19143deba86463b9da27db7e011b3a1&',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Name & Title area
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 81, horizontal: 51),
                  child: GestureDetector(
                    onTap: () {
                      // TODO: Handle name/title tap
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. Sarah Thompson',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Bitter',
                            color: Colors.black,
                            shadows: [
                              Shadow(
                                offset: const Offset(0, 4),
                                blurRadius: 4,
                                color: Colors.black.withOpacity(0.25),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Text(
                            'Clinical Psychologist',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter',
                              color: Colors.black,
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
                      ],
                    ),
                  ),
                ),

                // Bottom elements: Volume slider, call duration, and chat icon
                Positioned(
                  bottom: 0,
                  left: 19,
                  right: 42,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Volume slider + Phone icon
                      GestureDetector(
                        onTap: () {
                          // TODO: Handle volume slider tap
                        },
                        child: Container(
                          width: 42,
                          height: 181,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFF797979),
                          ),
                          padding: const EdgeInsets.fromLTRB(8, 31, 8, 8),
                          child: Column(
                            children: [
                              // Top part (volume slider background)
                              Container(
                                height: 62,
                                color: Colors.white.withOpacity(0.77),
                              ),
                              const SizedBox(height: 8),
                              // Middle circular knob
                              Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      const Color(0xFF04CA53).withOpacity(0.71),
                                ),
                                child: Center(
                                  child: Container(
                                    width: 14,
                                    height: 14,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: const Color(0xFF797979),
                                    ),
                                    child: Center(
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: const Color(0xFF00FF38)
                                              .withOpacity(0.59),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Bottom part (volume slider background)
                              Container(
                                height: 62,
                                color:
                                    const Color(0xFF00FF38).withOpacity(0.59),
                              ),
                              const SizedBox(height: 5),
                              // Phone icon (green call button)
                              GestureDetector(
                                onTap: () {
                                  // TODO: Handle phone icon tap (end call, etc.)
                                },
                                child: Image.network(
                                  'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/f3f9f6735fb0b6c7a633b5df32ef85fe36cc334a53a1b171a19de211adf3bb52?apiKey=f19143deba86463b9da27db7e011b3a1&',
                                  width: 26,
                                  height: 23,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 159),

                      // Call duration
                      GestureDetector(
                        onTap: () {
                          // TODO: Handle call duration tap
                        },
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFF726E6E),
                            ),
                            child: const Text(
                              '23:47',
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter',
                                color: Color(0xFF121417),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 106),

                      // Chat icon on the right
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            // TODO: Handle chat icon tap (open chat, etc.)
                          },
                          child: Image.network(
                            'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/7463e4bd6aa43bc3da94d7ff17fd28e5c18b4eecafcb6898f96e150e9f6b675b?apiKey=f19143deba86463b9da27db7e011b3a1&',
                            width: 30,
                            height: 24,
                            fit: BoxFit.contain,
                          ),
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
}
