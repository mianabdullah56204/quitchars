import 'package:flutter/material.dart';

class CustomButtonNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  const CustomButtonNavbar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 243, 241, 238),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(30),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _BottomIcon(
                icon: Icons.query_stats,
                label: "Statistics",
                selected: selectedIndex == 0,
                onTap: () => onItemTapped(0),
              ),
              _BottomIcon(
                icon: Icons.health_and_safety,
                label: "Health",
                selected: selectedIndex == 1,
                onTap: () => onItemTapped(1),
              ),
              _BottomIcon(
                icon: Icons.star,
                label: "Achievements",
                selected: selectedIndex == 2,
                onTap: () => onItemTapped(2),
              ),
              _BottomIcon(
                icon: Icons.info,
                label: "info",
                selected: selectedIndex == 3,
                onTap: () => onItemTapped(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _BottomIcon({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? Color.fromARGB(255, 75, 98, 5) : Colors.grey;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 26),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: color,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
