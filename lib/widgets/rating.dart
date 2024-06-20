import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    required this.value,
    this.color = Colors.black,
    this.onStarClicked,
  });
  final int value;
  final Color color;
  final Function(int)? onStarClicked;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 5; i++)
          InkWell(
            onTap: () {
              onStarClicked?.call(i + 1);
            },
            child: (value > i)
                ? Icon(
                    Icons.star,
                    color: color,
                  )
                : Icon(
                    Icons.star_border,
                    color: color,
                  ),
          ),
      ],
    );
  }
}
