import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        final isTablet = constraints.maxWidth >= 768 && constraints.maxWidth < 1024;
        
        return Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : (isTablet ? 48 : 80),
            vertical: isMobile ? 60 : 100,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Column(
                children: [
                  Text(
                    'About Us',
                    style: TextStyle(
                      fontSize: isMobile ? 36 : 48,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(isMobile ? 32 : 48),
                      child: Column(
                        children: [
                          Icon(
                            Icons.business_center,
                            size: isMobile ? 60 : 80,
                            color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'HQ Packing provides reliable and high-quality packaging solutions for businesses. We focus on durability, cost efficiency, and customer satisfaction.',
                            style: TextStyle(
                              fontSize: isMobile ? 18 : 20,
                              color: Colors.grey[800],
                              height: 1.8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 32),
                          Wrap(
                            spacing: 32,
                            runSpacing: 24,
                            alignment: WrapAlignment.center,
                            children: [
                              _FeatureItem(
                                icon: Icons.verified,
                                label: 'High Quality',
                                isMobile: isMobile,
                              ),
                              _FeatureItem(
                                icon: Icons.eco,
                                label: 'Eco-Friendly',
                                isMobile: isMobile,
                              ),
                              _FeatureItem(
                                icon: Icons.savings,
                                label: 'Cost Effective',
                                isMobile: isMobile,
                              ),
                              _FeatureItem(
                                icon: Icons.thumb_up,
                                label: 'Reliable',
                                isMobile: isMobile,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isMobile;

  const _FeatureItem({
    required this.icon,
    required this.label,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: isMobile ? 32 : 40,
          color: Theme.of(context).colorScheme.secondary,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: isMobile ? 14 : 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
