import 'package:assets/assets.dart';
import 'package:flutter/material.dart';

class CheckboxLabel extends StatefulWidget {
  final String label;
  final Function(bool) onChanged;
  final bool value;

  const CheckboxLabel({
    super.key,
    required this.label,
    required this.onChanged,
    required this.value,
  });

  @override
  State<CheckboxLabel> createState() => _CheckboxLabelState();
}

class _CheckboxLabelState extends State<CheckboxLabel> {
  late ValueNotifier<bool> isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = ValueNotifier(widget.value);
  }

  @override
  void dispose() {
    isChecked.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final newValue = !isChecked.value;
        isChecked.value = newValue;
        widget.onChanged(newValue);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: isChecked,
            builder: (context, child) {
              return Icon(
                isChecked.value
                    ? KapiraIcon.check_round_cut
                    : KapiraIcon.square,
              );
            },
          ),
          const SizedBox(width: 5),
          Text(widget.label),
        ],
      ),
    );
  }
}
