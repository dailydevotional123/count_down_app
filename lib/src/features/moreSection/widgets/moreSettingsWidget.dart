import 'package:flutter/material.dart';

import '../../../constants/appcolors.dart';

class MoreSettingsWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;

  const MoreSettingsWidget(
      {Key? key,
      required this.text,
      required this.onTap,
      this.color = AppColors.blackColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 14, decoration: TextDecoration.none, color: color),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_right))
        ],
      ),
    );
  }
}
