import 'package:flutter/material.dart';
import 'package:practical_travel_app/constants/appColor.dart';
import 'package:practical_travel_app/screens/destinationsDetailsScreen/destinationsDetailsScreen.dart';
import 'package:practical_travel_app/utils/styleUtils.dart';
import 'package:practical_travel_app/widgets/ratingIndicator.dart';

class DestinationWidget extends StatefulWidget {
  final String title;
  final String imagePath;
  final String location;
  final String description;
  final String price;

  final double rating;
  final bool isWishListed;

  const DestinationWidget({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.location,
    required this.description,
    required this.price,
    required this.rating,
    this.isWishListed = false,
  }) : super(key: key);

  @override
  State<DestinationWidget> createState() => _DestinationWidgetState();
}

class _DestinationWidgetState extends State<DestinationWidget> {
  bool _isWishListed = false;

  @override
  void initState() {
    _isWishListed = widget.isWishListed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _redirectToDestinationDetailsScreen,
      child: Container(
        height: 250,
        width: 186,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            _destinationImageWidget(widget.imagePath),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 12, bottom: 17.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleWidget(widget.title),
                  const SizedBox(height: 10),
                  _locationWidget(widget.location),
                  const SizedBox(height: 5),
                  _ratingBarWidget(widget.rating),
                ],
              ),
            ),
            _wishListButton(),
          ],
        ),
      ),
    );
  }

  Widget _destinationImageWidget(String imagePath) {
    return Container(
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [shadowBlackColor, Colors.transparent],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _titleWidget(String title) {
    return Text(
      title,
      style: fontStyleUrbanistSemiBold(fontSize: 20, fontColor: Colors.white),
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
          style: fontStyleUrbanistMedium(fontSize: 12, fontColor: Colors.white),
        )
      ],
    );
  }

  Widget _ratingBarWidget(double rating) {
    return RatingIndicator(rating: rating);
  }

  Widget _wishListButton() {
    return Positioned(
      top: 0,
      right: 0,
      child: GestureDetector(
        onTap: () => setState(() => _isWishListed = !_isWishListed),
        child: Container(
            height: 32,
            width: 32,
            margin: const EdgeInsets.only(top: 16, right: 16),
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: _isWishListed
                ? Image.asset('assets/icons/ic_fill_heart.png')
                : Image.asset(
                    'assets/icons/ic_empty_heart.png',
                    color: Colors.black,
                  )),
      ),
    );
  }

  _redirectToDestinationDetailsScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DestinationDetailsScreen(
          imagePath: widget.imagePath,
          title: widget.title,
          location: widget.location,
          description: widget.description,
          price: widget.price,
          rating: widget.rating,
          isWishListed: widget.isWishListed,
        ),
      ),
    );
  }
}
