import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final Color? backgroundColor;
  final Function()? onPressed;
  final Color? textColor;
  final ImageProvider? iconImage;
  final bool disabled;
  final Color? borderColor;
  final double? borderWidth;
  const CustomButton(
      {super.key,
      required this.title,
      this.backgroundColor,
      this.onPressed,
      this.textColor,
      this.iconImage,
      this.disabled = false,
      this.borderColor,
      this.borderWidth});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.disabled ? 0.5 : 1.0,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: widget.backgroundColor != null
                    ? widget.backgroundColor!
                    : Theme.of(context).colorScheme.surface,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: widget.borderColor ?? Colors.grey,
                      width: widget.borderWidth ?? 1.0,
                    ))),
            onPressed: () {
              if (widget.disabled) {
                return;
              } else {
                widget.onPressed!();
              }
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.iconImage != null)
                    Container(
                      margin: const EdgeInsets.only(right: 12),
                      child: Image(
                        image: widget.iconImage!,
                        height: 24,
                        width: 24,
                      ),
                    ),
                  Text(
                    widget.title,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: widget.textColor, fontSize: 16),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
