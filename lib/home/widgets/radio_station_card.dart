import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

const _kIconSize = 48.0;
const _kCardRadius = 12.0;

class RadioStationCard extends StatelessWidget {
  const RadioStationCard({
    required this.name,
    required this.url,
    required this.favicon,
    required this.onTap,
    super.key,
  });

  final String name;
  final String url;
  final String? favicon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_kCardRadius),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(_kCardRadius),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: _kIconSize,
                height: _kIconSize,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(_kCardRadius),
                ),
                child: favicon != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(_kCardRadius),
                        child: CachedNetworkImage(
                          height: _kIconSize,
                          width: _kIconSize,
                          fit: BoxFit.cover,
                          imageUrl: favicon!,
                          progressIndicatorBuilder: (context, url, progress) =>
                              Center(
                                child: SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    value: progress.progress,
                                  ),
                                ),
                              ),
                          errorWidget: (context, url, error) => Icon(
                            Icons.radio,
                            color: theme.colorScheme.primary,
                            size: 24,
                          ),
                        ),
                      )
                    : Icon(
                        Icons.radio,
                        color: theme.colorScheme.primary,
                        size: 24,
                      ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    if (url.isNotEmpty)
                      Text(
                        url,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.6,
                          ),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Icon(
                Icons.play_arrow,
                color: theme.colorScheme.primary,
                size: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
