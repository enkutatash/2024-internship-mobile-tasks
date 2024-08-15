import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/features/products/presentation/page/add_product_page.dart';
import 'package:ecommerce/features/products/presentation/search_page/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class RangeSliderView extends StatefulWidget {
  const RangeSliderView({super.key});

  @override
  State<RangeSliderView> createState() => _RangeSliderViewState();
}

class _RangeSliderViewState extends State<RangeSliderView> {
  RangeValues _currentRangeValues = const RangeValues(40, 41);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {
        // This will be called when state changes
        print("State updated on slider");
        print("Min Price: ${state.minPrice}");
        print("Max Price: ${state.maxPrice}");
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: RangeSlider(
            activeColor: AppColors.purple,
            values: _currentRangeValues,
            min: 0,
            max: 10000,
            divisions: 10,
            labels: RangeLabels(
              _currentRangeValues.start.round().toString(),
              _currentRangeValues.end.round().toString(),
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValues = values;
                context.read<SearchBloc>().add(PriceRange(
                    min: _currentRangeValues.start.round(),
                    max: _currentRangeValues.end.round()));
              });
            },
          ),
        );
      },
    );
  }
}
