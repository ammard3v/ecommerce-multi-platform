import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
class CustomRadioSelector extends StatefulWidget {
  const CustomRadioSelector({
    super.key,
    required this.itemCount,
    required this.data,
  });
  final int itemCount;
  final List<Map<String, String>> data;
  @override
  State<CustomRadioSelector> createState() => _CustomRadioSelectorState();
}
class _CustomRadioSelectorState extends State<CustomRadioSelector> {
  late String groupValue;
  @override
  void initState() {
    super.initState();
    groupValue = widget.data[0]["id"]!;
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.itemCount,
      itemBuilder: (context, index) {
        final item = widget.data[index];
        return ListTile(
          contentPadding: EdgeInsets.zero,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RatingBarIndicator(
                itemPadding: EdgeInsets.zero,
                rating: 4.5 - index.toDouble(),
                itemCount: 5,
                itemSize: 25,
                itemBuilder: (context, _) => const Icon(
                  Iconsax.star1,
                  color: Colors.yellow,
                ),
              ),
              SizedBox(width: 8),
              Text(item["title"]!), 
            ],
          ),
          trailing: Radio<String>(
            value: item["id"]!,
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = value!; 
              });
            },
          ),
        );
      },
    );
  }
}