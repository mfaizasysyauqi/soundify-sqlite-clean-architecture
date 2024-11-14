// lib/presentation/screens/main/main_screen.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/text_styles.dart';
import 'package:soundify/presentation/widgets/main/header_widget.dart';
import 'package:soundify/presentation/widgets/main/menu_modal.dart';
import 'package:soundify/presentation/widgets/main/sidebar_widget.dart';
// lib/presentation/screens/main/main_screen.dart
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? _currentUserRole;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _loadUserRole();
  }

  @override
  void dispose() {
    _closeModal();
    super.dispose();
  }

  Future<void> _loadUserRole() async {
    // Implement your user role loading logic here
    setState(() {
      _currentUserRole = 'User'; // Replace with actual role
    });
  }

  void _showModal(BuildContext context) {
    // Ensure any existing overlay is closed first
    _closeModal();
    
    // Create and show new overlay
    _overlayEntry = OverlayEntry(
      builder: (context) => MenuModal(
        currentUserRole: _currentUserRole,
        onClose: _closeModal,
      ),
    );

    if (mounted) {
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  void _closeModal() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondaryTextColor,
        body: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SidebarWidget(
                    onShowModal: _showModal,
                    currentUserRole: _currentUserRole,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          HeaderWidget(
                            onProfileTap: () => (),
                          ),
                        ],
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
