import 'package:flutter/material.dart';
import 'package:practical_travel_app/constants/appColor.dart';
import 'package:practical_travel_app/constants/constants.dart';
import 'package:practical_travel_app/utils/styleUtils.dart';
import 'package:practical_travel_app/widgets/ratingIndicator.dart';

class PopularPackageWidget extends StatefulWidget {
  final String resortName;
  final String resortImagePath;
  final String packagePrice;
  final String description;
  final double rating;
  final bool isWishListed;

  const PopularPackageWidget({
    Key? key,
    required this.resortName,
    required this.resortImagePath,
    required this.packagePrice,
    required this.description,
    required this.rating,
    this.isWishListed = false,
  }) : super(key: key);

  @override
  State<PopularPackageWidget> createState() => _PopularPackageWidgetState();
}

class _PopularPackageWidgetState extends State<PopularPackageWidget> {
  bool _isWishListed = false;

  @override
  void initState() {
    _isWishListed = widget.isWishListed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 163,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 7.5),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: popularPackageBorderColor),
      ),
      child: Row(
        children: [
          _resortImageWidget(widget.resortImagePath),
          const SizedBox(width: 8),
          _packageDetailsWidget(widget.resortName, widget.packagePrice,
              widget.rating, widget.description),
          _wishListIconWidget(),
        ],
      ),
    );
  }

  Widget _resortImageWidget(String resortImagePath) {
    return Expanded(
      flex: 30,
      child: SizedBox(
        height: 116,
        width: 86,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(resortImagePath, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _packageDetailsWidget(String resortName, String packagePrice,
      double rating, String description) {
    return Expanded(
      flex: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _resortNameWidget(resortName),
            const SizedBox(height: 10),
            _packagePriceWidget(packagePrice),
            const SizedBox(height: 5),
            _ratingIndicatorWidget(rating),
            const SizedBox(height: 5),
            _descriptionWidget(description)
          ],
        ),
      ),
    );
  }

  Widget _resortNameWidget(String resortName) {
    return Text(
      resortName,
      style: fontStyleUrbanistSemiBold(fontSize: 16),
    );
  }

  Widget _packagePriceWidget(String packagePrice) {
    return Text(
      '$rupeeSign$packagePrice',
      style: fontStyleUrbanistMedium(
        fontSize: 14,
        fontColor: packagePriceTextColor,
      ),
    );
  }

  Widget _ratingIndicatorWidget(double rating) {
    return RatingIndicator(rating: rating, textColor: Colors.black);
  }

  Widget _descriptionWidget(String description) {
    return Text(
      description,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: fontStyleUrbanistRegular(
              fontSize: 12, fontColor: packageDescriptionTextColor)
          .copyWith(height: 1.5),
    );
  }

  Widget _wishListIconWidget() {
    return Expanded(
      flex: 10,
      child: GestureDetector(
        onTap: () => setState(() => _isWishListed = !_isWishListed),
        child: Container(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: 22,
            width: 22,
            child: _isWishListed
                ? Image.asset('assets/icons/ic_fill_heart.png')
                : Image.asset('assets/icons/ic_empty_heart.png'),
          ),
        ),
      ),
    );
  }
}
