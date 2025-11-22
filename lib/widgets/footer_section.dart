import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        return Container(
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 48,
            vertical: isMobile ? 32 : 48,
          ),
          child: Column(
            children: [
              if (!isMobile) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildCompanyInfo(context),
                    ),
                    const SizedBox(width: 48),
                    Expanded(
                      child: _buildContactInfo(context),
                    ),
                  ],
                ),
              ] else ...[
                _buildCompanyInfo(context),
                const SizedBox(height: 24),
                _buildContactInfo(context),
              ],
              const SizedBox(height: 32),
              Container(
                height: 1,
                color: Colors.white.withOpacity(0.2),
              ),
              const SizedBox(height: 24),
              Text(
                '© 2025 HQ Packing. All rights reserved.',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCompanyInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.inventory_2,
              color: Colors.white,
              size: 32,
            ),
            const SizedBox(width: 12),
            Text(
              'HQ Packing',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'High Quality Packaging Solutions',
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Providing reliable and cost-effective\npackaging for businesses since 2022.',
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 14,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Us',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _FooterContactItem(
          icon: Icons.phone,
          text: '01120218510',
        ),
        const SizedBox(height: 12),
        _FooterContactItem(
          icon: Icons.email,
          text: 'hqforcardboard@gmail.com',
        ),
        const SizedBox(height: 12),
        _FooterContactItem(
          icon: Icons.location_on,
          text: 'Business District',
        ),
      ],
    );
  }
}

class _FooterContactItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FooterContactItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white.withOpacity(0.9),
          size: 20,
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
