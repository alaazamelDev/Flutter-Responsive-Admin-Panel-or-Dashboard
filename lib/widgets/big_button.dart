import 'package:admin/config/constants.dart';
import 'package:admin/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  const BigButton({
    Key? key,
    required this.title,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(10),
      child: DataCard(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: defaultPadding * 0.5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(color: primaryColor),
              ),
              Icon(
                icon,
                color: primaryColor.withOpacity(0.75),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
