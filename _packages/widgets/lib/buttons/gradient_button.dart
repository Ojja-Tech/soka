part of '../buttons.dart';

class ElevatedGradientButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback onPressed;
  final Gradient? gradient;

  const ElevatedGradientButton({
    super.key,
    required this.onPressed,
    this.child,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(context.kTheme.smallBorderRadius),
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(context.kTheme.smallBorderRadius),
        ),
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 88.0,
            minHeight: 36.0,
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
