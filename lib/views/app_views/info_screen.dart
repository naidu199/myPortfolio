import 'package:flutter/material.dart';
import 'package:portfolio/const/data.dart';
import 'package:portfolio/providers/screen_state.dart';
import 'package:provider/provider.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenState>(builder: (context, state, _) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade800,
              Colors.indigo.shade800,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.white.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          'Portfolio Information',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          height: 3,
                          width: 100,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.blue, Colors.purple],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Info Items
                  InfoItem(
                    label: 'Designed By',
                    value: name,
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 20),

                  const InfoItem(
                    label: 'Created At',
                    value: 'January 2025',
                    icon: Icons.calendar_today,
                  ),
                  const SizedBox(height: 20),

                  // Source Code with hover effect
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        state.launchAppUrl(
                            "https://github.com/naidu199/myPortfolio");
                      },
                      child: const InfoItem(
                        label: 'Source Code',
                        value: 'GitHub Repository',
                        icon: Icons.code,
                        isLink: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Social Icons
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialButton(
                          imagePath: "assets/icons/linkedin.png",
                          onTap: () => state.launchAppUrl(linkedIn),
                        ),
                        const SizedBox(width: 24),
                        SocialButton(
                          imagePath: "assets/icons/github.png",
                          onTap: () => state.launchAppUrl(github),
                        ),
                        const SizedBox(width: 24),
                        SocialButton(
                          imagePath: "assets/icons/email.png",
                          onTap: () => state.launchEmail(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Version
                  const InfoItem(
                    label: 'Version',
                    value: '1.0.1',
                    icon: Icons.info_outline,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

// Custom InfoItem Widget
class InfoItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final bool isLink;

  const InfoItem({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.isLink = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue.shade300, size: 24),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue.shade200,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                maxLines: 2,
                value,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  decoration: isLink ? TextDecoration.underline : null,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom Social Button Widget
class SocialButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const SocialButton({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(40),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              imagePath,
              height: 42,
              width: 42,
            ),
          ),
        ),
      ),
    );
  }
}
