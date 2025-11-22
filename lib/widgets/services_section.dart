import 'package:flutter/material.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        final isTablet =
            constraints.maxWidth >= 768 && constraints.maxWidth < 1024;

        return Container(
          width: double.infinity,
          color: Colors.grey[50],
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : (isTablet ? 48 : 80),
            vertical: isMobile ? 60 : 100,
          ),
          child: Column(
            children: [
              Text(
                'Our Services',
                style: TextStyle(
                  fontSize: isMobile ? 36 : 48,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Professional packaging solutions tailored to your needs',
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              ConstrainedBox(
                constraints:
                    const BoxConstraints(maxWidth: 1200, minHeight: 350),
                child: isMobile
                    ? Column(
                        children: [
                          _ServiceCard(
                            title: 'Duplex Paper Packing',
                            description:
                                'Durable, eco-friendly, suitable for heavy-duty packaging.',
                            icon: Icons.layers,
                            color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(height: 24),
                          _ServiceCard(
                            title: 'Cardboard Packing',
                            description:
                                'Lightweight, cost-effective, perfect for simple product packaging.',
                            icon: Icons.description,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ],
                      )
                    : IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: _ServiceCard(
                                title: 'Duplex Paper Packing',
                                description:
                                    'Durable, eco-friendly, suitable for heavy-duty packaging.',
                                icon: Icons.layers,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            const SizedBox(width: 32),
                            Expanded(
                              child: _ServiceCard(
                                title: 'Cardboard Packing',
                                description:
                                    'Lightweight, cost-effective, perfect for simple product packaging.',
                                icon: Icons.description,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const _ServiceCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -8.0 : 0.0),
        child: Card(
          elevation: _isHovered ? 12 : 4,
          shadowColor: widget.color.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            height: double.infinity,
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: _isHovered
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        widget.color.withOpacity(0.05),
                        widget.color.withOpacity(0.02),
                      ],
                    )
                  : null,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: _isHovered
                        ? widget.color
                        : widget.color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    widget.icon,
                    size: 48,
                    color: _isHovered ? Colors.white : widget.color,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: widget.color,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
