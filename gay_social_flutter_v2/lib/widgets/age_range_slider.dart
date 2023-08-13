import 'package:flutter/material.dart';

class AgeRangeFilter extends StatefulWidget {
  final RangeValues currentAgeRange;
  final Function(RangeValues) onAgeRangeChanged;

  const AgeRangeFilter({
    required this.currentAgeRange,
    required this.onAgeRangeChanged,
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AgeRangeFilterState createState() => _AgeRangeFilterState();
}

class _AgeRangeFilterState extends State<AgeRangeFilter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Age Range:',
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 8),
        RangeSlider(
          values: widget.currentAgeRange,
          min: 18,
          max: 75,
          divisions: 57,
          labels: RangeLabels(
            widget.currentAgeRange.start.round().toString(),
            widget.currentAgeRange.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              widget.onAgeRangeChanged(values);
            });
          },
        ),
      ],
    );
  }
}
