import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RadioStationImage extends StatelessWidget {
  const RadioStationImage({
    required this.imageUrl,
    required this.size,
    this.borderRadius,
    this.fallbackIconSize,
    super.key,
  });

  final String? imageUrl;
  final double size;
  final double? borderRadius;
  final double? fallbackIconSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveBorderRadius = borderRadius ?? size / 2;
    final effectiveFallbackIconSize = fallbackIconSize ?? size * 0.5;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
      ),
      child: imageUrl != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(effectiveBorderRadius),
              child: CachedNetworkImage(
                height: size,
                width: size,
                fit: BoxFit.cover,
                imageUrl: imageUrl!,
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: SizedBox(
                    height: size * 0.3,
                    width: size * 0.3,
                    child: CircularProgressIndicator(
                      strokeWidth: size > 60 ? 3 : 2,
                      value: progress.progress,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.radio,
                  size: effectiveFallbackIconSize,
                  color: theme.colorScheme.primary,
                ),
              ),
            )
          : Icon(
              Icons.radio,
              size: effectiveFallbackIconSize,
              color: theme.colorScheme.primary,
            ),
    );
  }
}
