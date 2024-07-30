import 'package:flutter/material.dart';
import 'package:shop/const/app_colors.dart';

class RangeSliderView extends StatefulWidget {
  const RangeSliderView({super.key});

  @override
  State<RangeSliderView> createState() => _RangeSliderViewState();
}

class _RangeSliderViewState extends State<RangeSliderView> {
  RangeValues _currentRangeValues = const RangeValues(40, 41);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RangeSlider(
        activeColor: AppColors.purple,
        values: _currentRangeValues,
        min: 39,
        max: 44,
        divisions: 5,
        labels: RangeLabels(
          _currentRangeValues.start.round().toString(),
          _currentRangeValues.end.round().toString(),
        ),
        onChanged: (RangeValues values) {
          setState(() {
            _currentRangeValues = values;
          });
        },
      ),
    );
  }
}
