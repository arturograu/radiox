import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget {
  const ControlButton({
    required this.icon,
    required this.onPressed,
    required this.tooltip,
    this.isPrimary = false,
    this.isLoading = false,
    super.key,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final String tooltip;
  final bool isPrimary;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (isPrimary) {
      return FloatingActionButton(
        onPressed: onPressed,
        tooltip: tooltip,
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    theme.colorScheme.onPrimary,
                  ),
                ),
              )
            : Icon(icon, size: 32),
      );
    }

    return IconButton(
      onPressed: onPressed,
      tooltip: tooltip,
      iconSize: 32,
      icon: Icon(icon),
      style: IconButton.styleFrom(
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
        side: BorderSide(
          color: theme.colorScheme.outline.withValues(alpha: 0.3),
        ),
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}
