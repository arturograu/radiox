import 'package:flutter/material.dart';
import 'package:radio_stations_repository/radio_stations_repository.dart';
import 'package:radiox/shared/widgets/widgets.dart';

class TrendingRadioCard extends StatelessWidget {
  const TrendingRadioCard({
    required this.radioStation,
    required this.onTap,
    super.key,
  });

  final RadioStation radioStation;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = [
      [Colors.orange.shade400, Colors.red.shade500],
      [Colors.purple.shade400, Colors.blue.shade600],
      [Colors.green.shade400, Colors.teal.shade600],
      [Colors.pink.shade400, Colors.purple.shade600],
      [Colors.blue.shade400, Colors.indigo.shade600],
      [Colors.amber.shade400, Colors.orange.shade600],
    ];
    final colorPair = colors[radioStation.name.hashCode % colors.length];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colorPair,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: colorPair[0].withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: -20,
              right: -20,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            // Main content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: RadioStationImage(
                        imageUrl: radioStation.favicon,
                        size: 60,
                        borderRadius: 12,
                        fallbackIconSize: 30,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    radioStation.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: colorPair[0],
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
