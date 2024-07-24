import 'package:flutter/material.dart';

import '../utils/constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.maximumSize = const Size(double.infinity, 52),
    required this.text,
    this.reverse = false,
    this.removePadding = false,
    //this.grediantColor = greenGredient,
    this.fontSize = 14,
    this.icon,
    required this.onPressed,
    this.minimumSize = const Size(double.infinity, 52),
    this.borderRadiusSize = 0,
    this.bgColor,
  });

  final VoidCallback? onPressed;

  //final List<Color> grediantColor;
  final String text;
  final Size maximumSize;
  final Size minimumSize;
  final Widget? icon;
  final double fontSize;
  final double borderRadiusSize;
  final Color? bgColor;
  final bool reverse;
  final bool removePadding;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(borderRadiusSize);

    return Container(
      decoration: BoxDecoration(borderRadius: borderRadius),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: borderRadius)),
          backgroundColor: WidgetStateProperty.all(Colors.amber),
          elevation: WidgetStateProperty.all(0.0),
          padding:
              removePadding ? WidgetStateProperty.all(EdgeInsets.zero) : null,
          minimumSize: WidgetStateProperty.all(minimumSize),
          maximumSize: WidgetStateProperty.all(maximumSize),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          splashFactory: NoSplash.splashFactory,
        ),
        child: Row(
            mainAxisAlignment: removePadding
                ? MainAxisAlignment.center
                : MainAxisAlignment.center,
            children: reverse
                ? [
                    if (icon != null) ...[
                      !removePadding
                          ? const SizedBox(
                              width: 15,
                            )
                          : const SizedBox(
                              width: 0,
                            ),
                      icon!,
                      removePadding
                          ? const SizedBox(
                              width: 10,
                            )
                          : const SizedBox(
                              width: 0,
                            )
                    ],
                    Expanded(
                      child: Text(
                        text,
                        style: TextStyle(
                            color: buttonTextColor,
                            fontSize: fontSize,
                            height: 1.5,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ]
                : [
                    Text(
                      text,
                      style: TextStyle(
                          color: buttonTextColor,
                          fontSize: fontSize,
                          height: 1.5,
                          fontWeight: FontWeight.w700),
                    ),
                    if (icon != null) ...[
                      const SizedBox(
                        width: 15,
                      ),
                      icon!
                    ],
                  ]),
      ),
    );
  }
}
