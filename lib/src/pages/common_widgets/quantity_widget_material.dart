import 'package:flutter/material.dart';

class QuantityWidgetMaterial extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const QuantityWidgetMaterial({
    super.key, required this.color, required this.icon, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {},
        child: Ink(
          height: 25,
          width: 25,
          decoration:  BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
           icon,
          color:Colors.white
          ),
        ),
      ),
    );
  }
}
