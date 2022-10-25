import 'package:flutter/material.dart';
import 'package:practical_travel_app/constants/appColor.dart';
import 'package:practical_travel_app/utils/styleUtils.dart';

class ChooseCategory extends StatefulWidget {
  final Function(String) onSelectCategory;

  const ChooseCategory({Key? key, required this.onSelectCategory})
      : super(key: key);

  @override
  State<ChooseCategory> createState() => _ChooseCategoryState();
}

class _ChooseCategoryState extends State<ChooseCategory> {
  final String categoryBeach = 'Beach';
  final String categoryMountain = 'Mountain';

  String? _selectedCategory;

  @override
  void initState() {
    _selectedCategory = categoryBeach;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _titleWidget(),
              _seeAllButtonWidget(),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _categoryWidget('assets/icons/ic_beach.png', categoryBeach),
              const SizedBox(width: 20),
              _categoryWidget('assets/icons/ic_mountain.png', categoryMountain),
            ],
          ),
        ],
      ),
    );
  }

  Widget _titleWidget() {
    return Text(
      'Choose Category',
      style: fontStyleInterMedium(fontSize: 16),
    );
  }

  Widget _seeAllButtonWidget() {
    return Text('See all',
        style: fontStyleInterMedium(
            fontSize: 12, fontColor: seeAllButtonTextColor));
  }

  Widget _categoryWidget(String categoryIconPath, String categoryName) {
    return GestureDetector(
      onTap: () => _onSelectCategory(categoryName),
      child: Container(
        height: 60,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: _selectedCategory == categoryName
                  ? selectedCategoryStrokeColor
                  : unSelectedCategoryStrokeColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _categoryIconWidget(categoryIconPath),
            _categoryNameWidget(categoryName),
          ],
        ),
      ),
    );
  }

  Widget _categoryIconWidget(String categoryIconPath) {
    return Image.asset(categoryIconPath);
  }

  Widget _categoryNameWidget(String categoryName) {
    return Text(
      categoryName,
      style: fontStyleUrbanistSemiBold(fontSize: 16),
    );
  }

  _onSelectCategory(String categoryName) {
    setState(() {
      _selectedCategory = categoryName;
    });

    widget.onSelectCategory(_selectedCategory!);
  }
}
