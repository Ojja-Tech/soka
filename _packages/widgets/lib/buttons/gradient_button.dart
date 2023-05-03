part of '../buttons.dart';

class ElevatedGradientButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  final Gradient? gradient;

  const ElevatedGradientButton({
    super.key,
    required this.onPressed,
    this.child,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Ink(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.all(
            Radius.circular(context.kTheme.smallBorderRadius),
          ),
        ),
        child: Container(
          constraints: BoxConstraints(
            minWidth:
                ElevatedButton.styleFrom().minimumSize?.resolve({})?.width ??
                    88,
            minHeight:
                ElevatedButton.styleFrom().minimumSize?.resolve({})?.height ??
                    36.0,
          ), // min sizes for Material buttons
          alignment: Alignment.center,
          child: child,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            context.kTheme.smallBorderRadius,
          ),
        ),
        padding: const EdgeInsets.all(0.0),
      ),
    );
  }
}
