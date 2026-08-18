import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
class PriceRangeSlider extends StatefulWidget {
  const PriceRangeSlider(
      {super.key, required this.onChanged, required this.initialRange});
  final Function(RangeValues) onChanged;
  final RangeValues initialRange;
  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}
class _PriceRangeSliderState extends State<PriceRangeSlider> {
  late RangeValues values;
  late double min;
  late double max;
  @override
  void initState() {
    super.initState();
    values = widget.initialRange;
    min = widget.initialRange.start;
    max = widget.initialRange.end;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSizes.md),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            padding: EdgeInsets.zero,
            activeTrackColor: AppColors.primary,
            inactiveTrackColor: AppColors.buttonDisabled,
            thumbColor: AppColors.primary,
            activeTickMarkColor: Colors.transparent,
            inactiveTickMarkColor: Colors.transparent,
          ),
          child: RangeSlider(
            values: values,
            min: min,
            max: max,
            labels: RangeLabels(values.start.toString(), values.end.toString()),
            divisions: 100,
            onChanged: (newValues) {
              setState(() {
                values = newValues;
              });
              widget.onChanged(newValues);
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("0"), Text("1000")],
        )
      ],
    );
  }
}