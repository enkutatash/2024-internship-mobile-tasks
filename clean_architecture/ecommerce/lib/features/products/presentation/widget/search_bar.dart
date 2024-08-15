import 'package:ecommerce/core/constants/colors.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final void Function(String)? onChange;
  const SearchField({this.onChange, super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.8,
      padding: EdgeInsets.only(left: 8.0, right: 8, top: 6, bottom: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        onChanged: onChange,
        decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey[600]),
            border: InputBorder.none,
            icon: Icon(Icons.search, color: Colors.grey[600]),
            suffixIcon: Icon(
              Icons.arrow_forward,
              color: AppColors.purple,
            )),
      ),
    );
  }
}
