// lib/presentation/widgets/main/main_content.dart
import 'package:flutter/material.dart';
import '../../../core/styles/colors.dart';
import '../../../core/utils/layout_manager.dart';
import '../../../core/constants/app_constants.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 2.0,
        right: 2.0,
        top: 12,
        bottom: 0,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: _buildPrimaryContainer(),
          ),
          if (LayoutManager.shouldShowSecondaryContainer(context)) ...[
            const SizedBox(width: 12),
            _buildSecondaryContainer(context),
          ],
        ],
      ),
    );
  }

  Widget _buildPrimaryContainer() {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget _buildSecondaryContainer(BuildContext context) {
    return Flexible(
      flex: MediaQuery.of(context).size.width <= LayoutBreakpoints.desktop ? 1 : 0,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: LayoutBreakpoints.maxSecondaryContainerWidth,
        ),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
