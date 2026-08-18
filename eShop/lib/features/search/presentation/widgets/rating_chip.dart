import 'package:flutter/material.dart';
import 'package:eshop/features/order/presentation/pages/barel.dart';
class RatingChipList extends StatefulWidget {
  const RatingChipList({
    super.key,
    required this.chips,
    required this.newValues,
    required this.showIcon,
  });
  final List<String> chips;
  final Function(Set<String>) newValues;
  final bool showIcon;
  @override
  State<RatingChipList> createState() => _RatingChipListState();
}
class _RatingChipListState extends State<RatingChipList> {
  Set<String> selectedData = {};
  @override
  void initState() {
    super.initState();
    selectedData.add("All");
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.chips.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final chipKey = widget.chips[index];
          return FilterChip(
            label: SizedBox(
              child: widget.showIcon
                  ? RatingChipRow(chipKey: chipKey)
                  : CategoryChipRow(chipKey: chipKey),
            ),
            selected: selectedData.contains(chipKey),
            showCheckmark: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            onSelected: (itemSelected) {
              setState(() {
                if (chipKey == "All") {
                  selectedData.clear();
                  if (itemSelected) selectedData.add("All");
                } else {
                  if (itemSelected) {
                    selectedData.add(chipKey);
                    selectedData.remove("All"); 
                  } else {
                    selectedData.remove(chipKey);
                  }
                }
              });
              widget.newValues(selectedData);
            },
          );
        },
      ),
    );
  }
}
class CategoryChipRow extends StatelessWidget {
  const CategoryChipRow({
    super.key,
    required this.chipKey,
  });
  final String chipKey;
  @override
  Widget build(BuildContext context) {
    return Text(chipKey);
  }
}
class RatingChipRow extends StatelessWidget {
  const RatingChipRow({
    super.key,
    required this.chipKey,
  });
  final String chipKey;
  @override
  Widget build(BuildContext context) {
    final String displayText;
    if (chipKey == "All" || chipKey == "5") {
      displayText = chipKey;
    } else {
      displayText = "≥$chipKey";
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.star_rounded,
          size: AppSizes.iconSM,
          color: AppColors.lightGrey,
        ),
        Text(displayText),
      ],
    );
  }
}