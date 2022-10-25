import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practical_travel_app/constants/appColor.dart';
import 'package:practical_travel_app/constants/constants.dart';
import 'package:practical_travel_app/utils/styleUtils.dart';
import 'package:practical_travel_app/widgets/ratingIndicator.dart';
import 'package:practical_travel_app/widgets/toolBar.dart';

class DestinationDetailsScreen extends StatefulWidget {
  final String imagePath;
  final String title;
  final String location;
  final String description;
  final String price;

  final double rating;
  final bool isWishListed;

  const DestinationDetailsScreen({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.location,
    required this.description,
    required this.price,
    required this.rating,
    this.isWishListed = false,
  }) : super(key: key);

  @override
  State<DestinationDetailsScreen> createState() =>
      _DestinationDetailsScreenState();
}

class _DestinationDetailsScreenState extends State<DestinationDetailsScreen> {
  bool _isWishListed = false;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    _isWishListed = widget.isWishListed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _destinationImageWidget(widget.imagePath),
          _detailsWidget(),
        ],
      ),
    );
  }

  Widget _destinationImageWidget(String imagePath) {
    return Container(
      foregroundDecoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [shadowBlackColor, Colors.transparent],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _detailsWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          const SizedBox(height: 50),
          ToolBar(
            leadingWidget: _backButton(),
            endWidget: _wishListWidget(),
            padding: EdgeInsets.zero,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _titleWidget(widget.title),
              _locationWidget(widget.location),
            ],
          ),
          const SizedBox(height: 20),
          _descriptionWidget(widget.description),
          const SizedBox(height: 20),
          _ratingIndicator(widget.rating),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _priceWidget(widget.price),
              _bookNowButton(),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _backButton() {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: SizedBox(
        height: 16,
        width: 16,
        child: Image.asset('assets/icons/ic_back.png'),
      ),
    );
  }

  Widget _wishListWidget() {
    return GestureDetector(
      onTap: () => setState(() => _isWishListed = !_isWishListed),
      child: SizedBox(
        height: 20,
        width: 20,
        child: _isWishListed
            ? Image.asset('assets/icons/ic_fill_heart.png')
            : Image.asset(
                'assets/icons/ic_empty_heart.png',
                color: Colors.white,
              ),
      ),
    );
  }

  Widget _titleWidget(String title) {
    return Text(
      title,
      style: fontStylePoppinsSemiBold(fontSize: 24, fontColor: Colors.white)
          .copyWith(
        decoration: TextDecoration.none,
      ),
    );
  }

  Widget _locationWidget(String location) {
    return Row(
      children: [
        SizedBox(
          height: 16,
          width: 16,
          child: Image.asset('assets/icons/ic_location.png'),
        ),
        const SizedBox(width: 5),
        Text(
          location,
          style: fontStyleUrbanistMedium(fontSize: 12, fontColor: Colors.white)
              .copyWith(
            decoration: TextDecoration.none,
          ),
        )
      ],
    );
  }

  Widget _descriptionWidget(String description) {
    return Text(
      description,
      style: fontStyleUrbanistRegular(fontSize: 12, fontColor: Colors.white)
          .copyWith(decoration: TextDecoration.none, height: 2),
    );
  }

  Widget _ratingIndicator(double rating) {
    return RatingIndicator(rating: rating);
  }

  Widget _priceWidget(String price) {
    return Text(
      '$rupeeSign$price/person',
      style: fontStylePoppinsMedium(fontSize: 14, fontColor: Colors.white)
          .copyWith(
        decoration: TextDecoration.none,
      ),
    );
  }

  Widget _bookNowButton() {
    return Container(
      height: 45,
      width: 103,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: selectedStartColor,
      ),
      child: Center(
        child: Text(
          'Book Now',
          style: fontStyleUrbanistSemiBold(fontSize: 14).copyWith(
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
