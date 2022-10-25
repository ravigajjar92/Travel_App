import 'package:flutter/material.dart';
import 'package:practical_travel_app/constants/constants.dart';
import 'package:practical_travel_app/screens/homeScreen/destinationWidget.dart';

class DestinationListWidget extends StatefulWidget {
  const DestinationListWidget({Key? key}) : super(key: key);

  @override
  State<DestinationListWidget> createState() => _DestinationListWidgetState();
}

class _DestinationListWidgetState extends State<DestinationListWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          children: const [
            DestinationWidget(
              title: 'Kuta Beach',
              imagePath: 'assets/images/img_kuta_beach.png',
              location: 'Bali, Indonesia',
              description: destinationDescription,
              price: '15,000',
              rating: 4.2,
              isWishListed: true,
            ),
            DestinationWidget(
              title: 'Baga Beach',
              imagePath: 'assets/images/img_baga_beach.png',
              location: 'Goa, India',
              description: destinationDescription,
              price: '15,000',
              rating: 4.8,
            ),
          ],
        ),
      ),
    );
  }
}
